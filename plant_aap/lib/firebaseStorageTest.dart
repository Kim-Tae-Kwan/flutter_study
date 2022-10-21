import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_aap/components/fire_base_storage.dart';
import 'package:plant_aap/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  File? _image;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  String _profileImageURL = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cloud Storage Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage:
              (_image != null) ? FileImage(_image!) : AssetImage('assets/images/bottom_img_1.png') as ImageProvider,
              radius: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: Text("Gallery"),
                  onPressed: () {
                    _uploadImageToStorage(ImageSource.gallery);
                  },
                ),
                ElevatedButton(
                  child: Text("Camera"),
                  onPressed: () {
                    _uploadImageToStorage(ImageSource.camera);
                  },
                )
              ],
            ),
            const Divider(color: Colors.grey, thickness: 1,),
            CircleAvatar(
              backgroundImage: _profileImageURL.isEmpty ? AssetImage('assets/images/bottom_img_1.png') : NetworkImage(_profileImageURL) as ImageProvider,
            ),
            Padding(padding: EdgeInsets.all(8.0), child: Text(_profileImageURL))
          ],
        ),
      ),
    );
  }

  _uploadImageToStorage(ImageSource source) async {
    // XFile? image = await ImagePicker().pickImage(source: source);
    List<XFile>? image = await ImagePicker().pickMultiImage();

    if (image == null) return;
    setState(() {
      _image = File(image[0].path);
    });

    for(var img in image){
      print(img.path);
    }


    // StorageService storageService = StorageService();
    // String downloadURL = await storageService.uploadFile(image[0].path);
    // setState(() {
    //   _profileImageURL = downloadURL;
    // });

    // Reference storageRef = _firebaseStorage.ref().child('profile/test');
    // print(await storageRef.getDownloadURL());
    // try {
    //   await storageRef.putFile(File(image!.path));
    //   // await storageRef.putFile(File('assets/images/bottom_img_1.png'));
    //   // await mountainsRef.putFile(file);
    // } on FirebaseException catch (e) {
    //   print(e.stackTrace);
    // }
    //
    // String? downloadURL = await storageRef.getDownloadURL();
    // if(downloadURL != null){
    //   setState(() {
    //     _profileImageURL = downloadURL;
    //   });
    // }
  }
}


