import 'package:flutter/material.dart';
import 'package:hello/step3_window_and_state/login_form_demo_v2.dart';
import 'package:provider/provider.dart';

import 'dart:io';

import 'login_form_demo.dart';
import 'state_simple.dart';

class LoginPage extends StatefulWidget{

  @override
  State createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage>{
  final TextEditingController _emailController = TextEditingController(text: 'your_name@gmail.com');
  final TextEditingController _passwordController = TextEditingController(text: 'input password');

  void _onLogin(BuildContext context){
    final String email = _emailController.text;
    final SimpleState state = Provider.of<SimpleState>(context);
    state.setEmail(email);

    Navigator.pushNamed(context, MAIN_PAGE);
  }

  void _onCancel() => exit(0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 120, 20, 120),
        child: Column(
            children: [
              Hero(
                tag: 'hero',
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 58.0,
                  child: Image.asset('assets/london.jpg'),
                ),
              ),
              const SizedBox(height: 15.0,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 15.0,),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(border: OutlineInputBorder(),),
                controller: _passwordController,
              ),
              SizedBox(height: 15.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(onPressed: () {}, child: Text('Log In')),
                  SizedBox(width: 10.0,),
                  OutlinedButton(onPressed: () { exit(0); }, child: Text('Cancel')),
                ],
              ),
            ]
        ),
      ),
    );
  }
}