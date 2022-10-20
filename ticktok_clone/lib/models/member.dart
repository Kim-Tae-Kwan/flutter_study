import 'package:cloud_firestore/cloud_firestore.dart';

class Member{
  String? name;
  String? imageURL;
  String? email;
  String? uid;

  Member({required this.name, required this.imageURL, required this.email, required this.uid});

  Member.fromSnap(DocumentSnapshot snapshot){
     var map = snapshot.data() as Map<String, dynamic>;
     name = map['name'];
     imageURL = map['image'];
     email = map['email'];
     uid = map['uid'];
  }

  Map<String, dynamic> toJson(){
    return {
      'name' : name,
      'image' : imageURL,
      'email' : email,
      'uid' : uid,
    };
  }



}