import 'package:flutter/material.dart';

void main() => runApp(const ListViewStaticDemo());

class ListViewStaticDemo extends StatelessWidget{
  static const String _title = '정적 ListView 위젯 데모';
  static const List<String> _data = [
    'kim',
    'seo',
    'park'
  ];

  const ListViewStaticDemo({super.key});

  Widget _buildStaticListView(){
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (BuildContext context, int i) {
        return ListTile(
          title: Text(
            _data[i],
            style: const TextStyle(
              fontSize: 23,
            ),
          ),
          trailing: const Icon(
            Icons.favorite_sharp
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),),
        body: _buildStaticListView(),
      ),
    );
  }
}