import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticktok_clone/contants.dart';
import 'package:ticktok_clone/controllers/auth_controller.dart';
import 'package:ticktok_clone/firebase_options.dart';
import 'package:ticktok_clone/views/screens/auth/login.dart';
import 'package:ticktok_clone/views/screens/auth/sign.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  ).then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ticktok clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor
      ),
      home: LoginScreen()
    );
  }
}

