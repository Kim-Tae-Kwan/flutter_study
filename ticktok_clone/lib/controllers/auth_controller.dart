import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ticktok_clone/contants.dart';
import 'package:ticktok_clone/models/member.dart';
import 'package:ticktok_clone/views/screens/auth/login.dart';
import 'package:ticktok_clone/views/screens/home_screen.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find<AuthController>();
  Rx<User?>? _user;
  Rx<File?>? _pickedImage;

  File? get profilePhoto => _pickedImage?.value;


  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user?.bindStream(firebaseAuth.authStateChanges());
    ever(_user!, _setInitialScreen);
  }
  _setInitialScreen(User? user){
    if(user == null){
      Get.offAll(() => LoginScreen());
    }else{
      Get.offAll(() => HomeScreen());
    }

  }


  void loginUser({required String email, required String password}) async{
    try{
      if(email.isNotEmpty && password.isNotEmpty){
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        print('login success');
      }else{
        Get.snackbar('Error Login', 'Please enter all the fields.');
      }
    }catch (e){
      Get.snackbar('Error Create Account', e.toString());
    }
  }

  void resisterUser({required String username, required String email, required String password, File? image}) async{
    try{
      if(username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && image != null){
        //Firebase auth resister.
        UserCredential credential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
        //Profile image save in storage.
        String downloadURL = await _uploadToStorage(image);
        //User metadata save in FireStore.
        Member user = Member(
          name: username,
          imageURL: downloadURL,
          email: email,
          uid: credential.user!.uid
        );
        await firestore.collection('users').doc(credential.user!.uid).set(user.toJson());
      }
    }catch(e){
      Get.snackbar('Error Create Account', e.toString());
    }
  }
  _uploadToStorage(File? image) async{
    var ref = firebaseStorage.ref().child('profile').child(firebaseAuth.currentUser!.uid);
    TaskSnapshot snapshot = await ref.putFile(image!);
    return await snapshot.ref.getDownloadURL();
  }

  pickImage() async{
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      Get.snackbar('Profile Picture', 'You have successfully selected your profile picture!');
      _pickedImage = Rx<File?>(File(image!.path));
    }
  }
}