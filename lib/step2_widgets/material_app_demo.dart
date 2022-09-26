import 'package:flutter/material.dart';

void main() => runApp(MyMaterialApp());

class MyMaterialApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '머티리얼 앱',
      home: Scaffold(
        appBar: AppBar(title: Text('진짜 머티리얼 앱'),),
        body: Text('이제야 제대로 된 머티리얼 앱.'),
      ),
      // home: Container(
      //   padding: EdgeInsets.all(20),
      //   child: Text('이제는 머티리얼 앱입니다.'),
      // ),
    );
  }
}