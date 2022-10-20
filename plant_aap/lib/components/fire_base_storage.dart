import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class StorageService{
  late final FirebaseStorage storage;
  late final storageReference;
  late Uuid uuid;

  StorageService(){
    storage = FirebaseStorage.instance;
    storageReference = storage.ref().child('profile');
    uuid = const Uuid();
  }

  Future<String> uploadFile(String imagePath) async{
    String fileName = uuid.v4().replaceAll('-', '');

    Reference storageRef = storageReference.child(fileName);
    try {
      await storageRef.putFile(File(imagePath));
    } on FirebaseException catch (e) {
      print(e.stackTrace);
    }

    return await storageRef.getDownloadURL();
  }

}