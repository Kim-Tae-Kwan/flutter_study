import 'package:flutter/material.dart';
import 'page_subway_main.dart';

void main() => runApp(SubwayDemo());

class SubwayDemo extends StatelessWidget{
  const SubwayDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.cyan,
      title: '지하철 실시간 정보',
      home: MainPage(),
    );
  }
}