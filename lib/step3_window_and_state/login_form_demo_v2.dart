import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  // ChangeNotifierProvider(
  //   builder: (context) => SimpleState(),
  //   child: StateLoginDemo(),
  // )
);

const String ROOT_PAGE = '/';
const String MAIN_PAGE = '/main';

class StateLoginDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '로그린 폼',
      debugShowCheckedModeBanner: false,
      initialRoute: ROOT_PAGE,
      routes: {
        // ROOT_PAGE : (context) => LoginPage(),
        // MAIN_PAGE : (context) => MainPage()
      },
    );
  }
}