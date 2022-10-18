import 'package:firebase_database/firebase_database.dart';

class Review {
  String? key;
  String? id;
  String? review;
  String? createTime;

  Review(this.id, this.review, this.createTime);

  Review.fromSnapshot(DataSnapshot snapshot){
    key = snapshot.key;
    id = (snapshot.value! as Map)['id'];
    id = (snapshot.value! as Map)['review'];
    createTime = (snapshot.value! as Map)['createTime'];
  }

  toJson() => {
    'id' : id,
    'review' : review,
    'createTime' : createTime,
  };
}