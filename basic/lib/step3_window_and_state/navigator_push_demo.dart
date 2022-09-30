import 'package:flutter/material.dart';

void main() => runApp(const NavigatorPushDemo());

class NavigatorPushDemo extends StatelessWidget{
  const NavigatorPushDemo({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget{
  const MainPage({super.key});


  _showNextPage(BuildContext context){
    return Navigator.push(context, MaterialPageRoute(builder: (context) => const NextPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigator 기본 데모'),),
      body: Center(
        child: OutlinedButton(
          onPressed: () => _showNextPage(context),
          child: const Text('다음 화면으로 이동'),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget{
  const NextPage({super.key});

  _backToMainPage(BuildContext context){
    return Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('다음페이지'),),
      body: Center(
        child: OutlinedButton(
          onPressed: () => _backToMainPage(context),
          child: const Text('돌아가기'),
        ),
      ),
    );
  }
}