import 'package:cardrpt/pages/searchReport.dart';
import 'package:cardrpt/pages/searchResult.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '카드보고서',
      initialRoute: '/',
      routes: {
        '/' : (context) => searchReport(),
        '/result' : (context) => SearchResult()

      },
    );
  }
}

