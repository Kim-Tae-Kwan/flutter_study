import 'package:flutter/material.dart';

void main() => runApp(const NavigatorRoutesDemo());

class NavigatorRoutesDemo extends StatelessWidget{
  const NavigatorRoutesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' :  (context) => const MainPage(),
        '/next' : (context) => const NextPage()
      },
    );
  }
}

class MainPage extends StatelessWidget{
  const MainPage({super.key});


  _showNextPage(BuildContext context){
    return Navigator.pushNamed(context, '/next');
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
          // onPressed: () => _backToMainPage(context),
          onPressed: () => print('back'),
          child: const Text('돌아가기'),
        ),
      ),
    );
  }
}