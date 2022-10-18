import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modu_tour/page/loginPage.dart';
import 'package:modu_tour/page/mainPage.dart';
import 'package:modu_tour/page/signPage.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'tour_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE place(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, tel TEXT , zipcode TEXT , address TEXT , mapx Number , mapy Number , imagePath TEXT)",
        );
      },
      version: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<Database> database = initDatabase();
    return MaterialApp(
      title: '모두의 여행',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const LoginPage(),
        '/sign' : (context) =>  const SignPage(),
        '/main' : (context) => MainPage(database: database,)
      },
    );
  }
}