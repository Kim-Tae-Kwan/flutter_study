import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(RowColumnDemo());

class RowColumnDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Form',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 150),
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
                initialValue: 'your_name@gmail.com',
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(onPressed: () {}, child: Text('Log In')),
                  SizedBox(width: 10.0,),
                  OutlinedButton(onPressed: () { exit(0); }, child: Text('Cancel')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}