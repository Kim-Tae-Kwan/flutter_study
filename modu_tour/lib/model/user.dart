import 'package:firebase_database/firebase_database.dart';

class User {
  String? key;
  String? id;
  String? pw;
  String? createTime;

  User(this.id, this.pw, this.createTime);

  User.fromSnapshot(DataSnapshot snapshot){
    String secondKey = (snapshot.value! as Map).keys.first;
    Map data = (snapshot.value! as Map)[secondKey];

    key = snapshot.key;
    id = data['id'];
    pw = data['pw'];
    createTime = data['createTime'];
  }

  toJson() => {
    'id' : id,
    'pw' : pw,
    'createTime' : createTime
  };
}