import 'package:flutter/material.dart';
import 'package:login/components/custom_form.dart';
import 'package:login/components/logo.dart';
import 'package:login/size.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SizedBox(height: xlarge_gap,),
            Logo("login"),
            SizedBox(height: large_gap,),
            CustomForm()
          ],
        ),
      )
    );
  }
}
