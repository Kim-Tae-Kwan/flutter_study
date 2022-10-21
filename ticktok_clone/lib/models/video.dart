import 'package:cloud_firestore/cloud_firestore.dart';

class Video{
  String? username;
  String? uid;
  String? id;
  List? likes;
  int? commentCount;
  int? shareCount;
  String? songName;
  String? caption;
  String? videoUrl;
  String? thumbnail;
  String? profilePhoto;

  Video({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
    required this.songName,
    required this.caption,
    required this.videoUrl,
    required this.thumbnail,
    required this.profilePhoto
  });

  Video.fromSnapshot(DocumentSnapshot snapshot){
    var map = snapshot.data() as Map<String, dynamic>;
    username = map['username'];
    uid = map['uid'];
    id = map['id'];
    likes = map['likes'];
    commentCount = map['commentCount'];
    shareCount = map['shareCount'];
    songName = map['songName'];
    caption = map['caption'];
    videoUrl = map['videoUrl'];
    thumbnail = map['thumbnail'];
    profilePhoto = map['profilePhoto'];
  }

  Map<String, dynamic> toJson(){
    return {
      'username' : username,
      'uid' : uid,
      'id' : id,
      'likes' : likes,
      'commentCount' : commentCount,
      'shareCount' : shareCount,
      'songName' : songName,
      'caption' : caption,
      'videoUrl' : videoUrl,
      'thumbnail' : thumbnail,
      'profilePhoto' : profilePhoto,
    };
  }
}