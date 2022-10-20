import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ticktok_clone/contants.dart';
import 'package:ticktok_clone/views/screens/auth/login.dart';
import 'package:ticktok_clone/views/widgets/text_input_field.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({Key? key}) : super(key: key);

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  final TextEditingController _uaerNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 100),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                'Tiktok Clone',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: buttonColor
                ),
              ),
              const Text(
                'Resister',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700
                ),
              ),
              const SizedBox(height: 25,),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage: authController.profilePhoto == null
                        ? const NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/149/149071.png')
                        : FileImage(authController.profilePhoto!) as ImageProvider,
                    backgroundColor: Colors.black12,
                  ),
                  Positioned(
                    left: 80,
                    bottom: -10,
                    child: IconButton(
                      onPressed: () async {
                        await authController.pickImage();
                        setState(() {});
                      },
                      icon: const Icon(Icons.camera_alt),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25,),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _uaerNameController,
                  labelText: 'Username',
                  icon: Icons.account_circle_sharp,
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _emailController,
                  labelText: 'Email',
                  icon: Icons.email,
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _passwordController,
                  labelText: 'Password',
                  icon: Icons.lock,
                  isObscure: true,
                ),
              ),
              const SizedBox(height: 30,),
              InkWell(
                onTap: () {
                  authController.resisterUser(
                    username: _uaerNameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                    image: authController.profilePhoto
                  );
                },
                focusColor: Colors.white,
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 40,
                  height: 50,
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: const Center(
                    child: Text(
                      'Resister',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      'Already have an account?'
                  ),
                  const SizedBox(width: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(),));
                    },
                    // hoverColor: Colors.white,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: buttonColor
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }
}
