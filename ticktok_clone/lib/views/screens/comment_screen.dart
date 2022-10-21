import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticktok_clone/controllers/comment_controller.dart';

class CommentScreen extends StatelessWidget {
  final String id;
  CommentScreen({Key? key, required this.id}) : super(key: key);

  final TextEditingController commentTextController = TextEditingController();
  final CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    commentController.updatePostId(id);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Obx((){
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.black,
                          backgroundImage: NetworkImage('profile photo'),
                        ),
                        title: Row(
                          children: const [
                            Text(
                              'username',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              'comment description',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        subtitle: Row(
                          children: const [
                            Text(
                              'data',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '10 likes',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.favorite,
                            size: 25,
                            color: Colors.red,
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              const Divider(),
              ListTile(
                title: TextField(
                  maxLines: 3,
                  controller: commentTextController,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                  decoration: const InputDecoration(
                      label: Text('Comment'),
                      labelStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red))),
                ),
                trailing: TextButton(
                  onPressed: () {
                    commentController.postComment(commentTextController.text);
                  },
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
