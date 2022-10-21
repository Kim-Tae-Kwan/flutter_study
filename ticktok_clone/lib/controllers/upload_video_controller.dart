import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:ticktok_clone/contants.dart';
import 'package:ticktok_clone/models/video.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  uploadVideo(String name, String caption, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
      await firestore.collection('users').doc(uid).get();

      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;

      String downloadURL = await _uploadVideoToStorage('Video $len', videoPath);
      String thumbnail = await _uploadImageToStorage('Video $len', videoPath);

      Video video = Video(
        username: (userDoc.data() as Map)['name'],
        uid: uid,
        id: 'Video $len',
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songName: name,
        caption: caption,
        videoUrl: downloadURL,
        thumbnail: thumbnail,
        profilePhoto: (userDoc.data() as Map)['image']
      );

      await firestore.collection('videos').doc('Video $len').set(video.toJson());
      Get.back();
    } catch (e) {
      Get.snackbar('Error Uploading Video', e.toString());
    }
  }

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    var ref = firebaseStorage.ref().child('video').child(id);
    UploadTask uploadTask = ref.putFile(await _compressVedeo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadURL = await snap.ref.getDownloadURL();
    return downloadURL;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    var ref = firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadURL = await snap.ref.getDownloadURL();
    return downloadURL;
  }

  _compressVedeo(String videoPath) async {
    final compressVideo = await VideoCompress.compressVideo(
        videoPath, quality: VideoQuality.MediumQuality);
    return compressVideo!.file;
  }

  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

}
