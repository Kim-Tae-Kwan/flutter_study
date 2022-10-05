import 'package:flutter/material.dart';
import 'package:login/pages/home_page.dart';
import 'package:login/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            minimumSize: Size(400, 60)
          )
        )
      ),
      initialRoute: '/login',
      routes: {
        '/login' : (context) => LoginPage(),
        '/home' : (context) => HomePage(),
      },
    );
  }
}



