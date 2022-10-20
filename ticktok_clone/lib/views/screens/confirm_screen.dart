import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ticktok_clone/controllers/upload_video_controller.dart';
import 'package:ticktok_clone/views/widgets/text_input_field.dart';
import 'package:video_player/video_player.dart';
import 'package:get/get.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;

  ConfirmScreen({Key? key, required this.videoFile, required this.videoPath}) : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  final TextEditingController _songController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();
  final UploadVideoController _uploadVideoController = Get.put(UploadVideoController());


  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            SizedBox(
              width: size.width,
              height: size.height / 2,
              child: VideoPlayer(controller),
            ),
            SizedBox(height: 30,),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: size.width - 20,
                    child: TextInputField(
                      controller: _songController,
                      labelText: 'Song name',
                      icon: Icons.music_note,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: size.width - 20,
                    child: TextInputField(
                      controller: _captionController,
                      labelText: 'Caption name',
                      icon: Icons.closed_caption,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: (){
                      _uploadVideoController.uploadVideo(_songController.text, _captionController.text, widget.videoPath);
                    },
                    child: const Text('Share!', style: TextStyle(fontSize: 20, color: Colors.white),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
