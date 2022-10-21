import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ticktok_clone/contants.dart';
import 'package:ticktok_clone/views/screens/confirm_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: InkWell(
          onTap: () => _showOptionsDialog(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(color: buttonColor),
            child: const Center(
              child: Text(
                'Add Video',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showOptionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                _pickVideo(context, ImageSource.gallery);
              },
              child: Row(
                children: const [
                  Icon(Icons.image),
                  Padding(
                    padding: EdgeInsets.all((7)),
                    child: Text(
                      'Gallery',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                _pickVideo(context, ImageSource.camera);
              },
              child: Row(
                children: const [
                  Icon(Icons.camera_alt),
                  Padding(
                    padding: EdgeInsets.all((7)),
                    child: Text(
                      'Camera',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.of(context).pop(),
              child: Row(
                children: const [
                  Icon(Icons.cancel),
                  Padding(
                    padding: EdgeInsets.all((7)),
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  _pickVideo(BuildContext context, ImageSource source) async {
    XFile? video = await ImagePicker().pickVideo(source: source);
    if(video != null){
      Get.to(ConfirmScreen(videoFile: File(video.path), videoPath: video.path));
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConfirmScreen(videoFile: File(video.path), videoPath: video.path),));
    }
  }
}
