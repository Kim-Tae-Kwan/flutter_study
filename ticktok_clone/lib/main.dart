import 'package:flutter/material.dart';
import 'package:ticktok_clone/contants.dart';
import 'package:ticktok_clone/views/screens/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticktok clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor
      ),
      home: LoginScreen()
    );
  }
}

