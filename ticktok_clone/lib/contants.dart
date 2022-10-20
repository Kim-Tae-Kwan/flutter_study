import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ticktok_clone/controllers/auth_controller.dart';
import 'package:ticktok_clone/views/screens/add_video_screen.dart';
import 'package:ticktok_clone/views/screens/video_screen.dart';

var pages = [
  VideoScreen(),
  const Text('search'),
  const AddVideoScreen(),
  const Text('message'),
  const Text('profile'),
];

//Colors
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

//Firebase
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

//Contoller
var authController = AuthController.instance;