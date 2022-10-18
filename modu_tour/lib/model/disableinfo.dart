import 'package:firebase_database/firebase_database.dart';

class DisableInfo {
  String? key;
  int? disable1;
  int? disable2;
  String? id;
  String? createTime;

  DisableInfo(this.id, this.disable1, this.disable2, this.createTime);

  DisableInfo.fromSnapshot(DataSnapshot snapshot){
    if(snapshot.value != null){
      Map value = snapshot.value as Map;

      key = snapshot.key!;
      disable1 = value['disable1'];
      disable2 = value['disable2'];
      id = value['id'];
      createTime = value['createTime'];
    }
  }

  toJson() => {
    'id' : id,
    'disable1' : disable1,
    'disable2' : disable2,
    'createTime' : createTime,
  };

}