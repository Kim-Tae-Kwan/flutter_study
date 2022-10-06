import 'package:cardrpt/pages/searchReport.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '카드보고서',
      home: Scaffold(
        appBar: AppBar(title: Text('카드보고서')),
        body: searchReport()
      ),
    );
  }
}

