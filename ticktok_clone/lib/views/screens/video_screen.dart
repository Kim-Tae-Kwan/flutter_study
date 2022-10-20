import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticktok_clone/controllers/video_controller.dart';
import 'package:ticktok_clone/views/widgets/circle_animation.dart';
import 'package:ticktok_clone/views/widgets/video_player_item.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({Key? key}) : super(key: key);

  final VideoController videoController = Get.put(VideoController());

  _buildProfile(String profilePhto) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        children: [
          Positioned(
            left: 5,
            child: Container(
              width: 50,
              height: 50,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(profilePhto),
                ),
              ),
            ),

          ),
        ],
      ),
    );
  }

  _buildMusicAlbum(String profilePhoto){
    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(11),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [
                    Colors.grey,
                    Colors.white
                  ]
              ),
              borderRadius: BorderRadius.circular(25)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(profilePhoto),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: Obx(() {
          return PageView.builder(
            itemCount: 1,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  VideoPlayerItem(videoUrl: videoController.videoList[index].videoUrl!),
                  Column(
                    children: [
                      const SizedBox(height: 100,),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text(
                                      'username',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    const Text(
                                      'caption',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        Icon(Icons.music_note),
                                        Text(
                                          'caption',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              margin: EdgeInsets.only(top: size.height / 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildProfile('string url'),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () {

                                        },
                                        child: const Icon(
                                          Icons.favorite,
                                          size: 40,
                                          color: Colors.red,
                                        )
                                      ),
                                      const SizedBox(height: 7,),
                                      const Text('2,200', style: TextStyle(fontSize: 20, color: Colors.white),),
                                      InkWell(
                                          onTap: () {

                                          },
                                          child: const Icon(
                                            Icons.comment,
                                            size: 40,
                                            color: Colors.red,
                                          )
                                      ),
                                      const SizedBox(height: 7,),
                                      const Text('2,200', style: TextStyle(fontSize: 20, color: Colors.white),),
                                      InkWell(
                                          onTap: () {

                                          },
                                          child: const Icon(
                                            Icons.reply,
                                            size: 40,
                                            color: Colors.red,
                                          )
                                      ),
                                      const SizedBox(height: 7,),
                                      const Text('2', style: TextStyle(fontSize: 20, color: Colors.white),),
                                      CircleAnimation(child: _buildMusicAlbum(''))

                                    ],
                                  )
                                ],
                              ),
                            )

                          ],
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          );
        }
      ),
    );
  }
}
