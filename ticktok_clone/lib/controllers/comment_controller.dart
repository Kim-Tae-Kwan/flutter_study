import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ticktok_clone/contants.dart';
import 'package:ticktok_clone/models/comment.dart';

class CommentController extends GetxController{
  final Rx<List<Comment>> _comments = Rx<List<Comment>>([]);
  List<Comment> get comments => _comments.value;

  String _postId = '';

  updatePostId(String id){
    _postId = id;
    getComment();
  }

  getComment() async {

  }

  postComment(String commentText) async {
    try{
      if(commentText.isNotEmpty){
        late Map<String, dynamic> userDoc;
        await firestore.collection('users').doc(authController.user!.uid).get()
            .then((value) {
          userDoc = value.data() as Map<String, dynamic>;
        },);
        var allDoc = await firestore.collection('videos').doc(_postId).collection('comments').get();
        int len = allDoc.docs.length;

        Comment comment = Comment(
            username: userDoc['name'],
            comment: commentText,
            dataPublished: DateTime.now().toIso8601String(),
            likes: [],
            profilePhoto: userDoc['profilePhoto'],
            uid: userDoc['uid'],
            id: 'Comment $len'
        );

        firestore.collection('videos').doc(_postId).collection('comments').doc('Comment $len').set(comment.toJson());
      }
    }catch (e){
      Get.snackbar('Post Comment Error', e.toString());
    }
  }
}