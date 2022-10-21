import 'package:cloud_firestore/cloud_firestore.dart';

class Comment{
  String? username;
  String? comment;
  String? dataPublished;
  List<String>? likes;
  String? profilePhoto;
  String? uid;
  String? id;

  Comment({
    required this.username,
    required this.comment,
    required this.dataPublished,
    required this.likes,
    required this.profilePhoto,
    required this.uid,
    required this.id
  });

  Comment.fromSnapshot(DocumentSnapshot snapshot){
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    username = map['username'];
    comment = map['comment'];
    dataPublished = map['dataPublished'];
    likes = map['likes'];
    profilePhoto = map['profilePhoto'];
    uid = map['uid'];
    id = map['id'];
  }

  toJson(){
    return {
      'username' : username,
      'comment' : comment,
      'dataPublished' : dataPublished,
      'likes' : likes,
      'profilePhoto' : profilePhoto,
      'uid' : uid,
      'id' : id,
    };
  }



}