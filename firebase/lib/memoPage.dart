import 'package:firebase/memo.dart';
import 'package:firebase/memoAdd.dart';
import 'package:firebase/memoDetailPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_admob_config/firebase_admob_config.dart';
import 'package:flutter/material.dart';

class MemoPage extends StatefulWidget {
  const MemoPage({Key? key}) : super(key: key);

  @override
  State<MemoPage> createState() => _MemoPageState();
}

class _MemoPageState extends State<MemoPage> {
  late FirebaseDatabase _database;
  late DatabaseReference reference;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final String _databaseURL = 'https://exmple-d9fe0-default-rtdb.firebaseio.com/';
  List<Memo> memos = [];


  @override
  void initState() {
    super.initState();
    _database = FirebaseDatabase.instance;
    reference = _database.ref();

    reference.onChildAdded.listen((event) {
      print(event.snapshot.value.toString());
      setState(() {
        memos.add(Memo.fromSnapshot(event.snapshot));
      });
    });

    // AppBannerAd appBannerAd = AppBannerAd(
    //   config: BannerConfig(
    //
    //   ),
    // );
    // _firebaseMessaging.getToken().then((value) => print('Firebase messaging token : $value'));
    // Future<NotificationSettings> settings = _firebaseMessaging.requestPermission(
    //   alert: true,
    //   announcement: false,
    //   badge: true,
    //   carPlay: false,
    //   criticalAlert: false,
    //   provisional: false,
    //   sound: true,
    // );
    //
    // settings.then((value) => print('User granted permission: ${value.authorizationStatus}'));
    //
    // FirebaseMessaging.onMessage.listen((event) {
    //   print('onMessage : ${event.data}');
    // });

    // FirebaseMessaging.onBackgroundMessage((message) async{
    //   print('messaging : ${message.data}');
    // },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('메모 앱'),),
      body: Container(
        child: Center(
          child: memos.isEmpty ? const CircularProgressIndicator() : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Card(
                child: GridTile(
                  header: Text(memos[index].title!),
                  footer: Text(memos[index].createTime!.substring(0, 10)),
                  child: Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: SizedBox(
                      child: GestureDetector(
                        onTap: () async {
                         Memo? memo = await Navigator.of(context).push(
                            MaterialPageRoute<Memo>(
                              builder: (context) {
                                return MemoDetailPage(memo: memos[index],reference: reference,);
                              },
                            )
                          );
                         if(memo != null){
                           setState(() {
                             memos[index].title = memo.title;
                             memos[index].content = memo.content;
                           });
                         }
                        },
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(memos[index].title!),
                                content: const Text('삭제하시겠습니까?'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      reference
                                          .child(memos[index].key!)
                                          .remove()
                                          .then((_) {
                                            setState(() {
                                              memos.removeAt(index);
                                              Navigator.of(context).pop();
                                            });
                                      });
                                    },
                                    child: const Text('예'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('아니요ㅅ'),
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: Text(memos[index].content!),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: memos.length,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MemoAddPage(reference),)
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
