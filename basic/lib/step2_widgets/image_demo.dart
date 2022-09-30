import 'package:flutter/material.dart';

void main() => runApp(const ImageDemo());

class ImageDemo extends StatelessWidget{
  static const String _title = "Image 위젯 데모";

  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/london.jpg'),
            Image.asset('assets/autum-leaves.jpg'),
          ],
        ),
      ),
    );
  }
}