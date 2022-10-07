import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Future Builder Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '이곳은 데이터 상관없이 불려져 오는 곳입니다.',
              style: TextStyle(fontSize: 20),
            ),
            FutureBuilder(
                future: _fetch1(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                  if (snapshot.hasData == false) {
                    print('No Data');
                    print(snapshot.data);
                    return CircularProgressIndicator();
                  }
                  //error가 발생하게 될 경우 반환하게 되는 부분
                  else if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  }
                  // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
                  else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        snapshot.data.toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }

  Future<dynamic> _fetch1() async {
    // var url = 'https://api.mockaroo.com/api/5ee43e50?count=1&key=6213f2b0';
    // final response = await http.get(Uri.parse(url));
    //
    // if (response.statusCode == 200) {
    //   //만약 서버가 ok응답을 반환하면, json을 파싱합니다
    //   print('응답했다');
    //   print(json.decode(response.body));
    //   return Info.fromJson(json.decode(response.body));
    // } else {
    //   //만약 응답이 ok가 아니면 에러를 던집니다.
    //   throw Exception('계좌정보를 불러오는데 실패했습니다');
    // }

    await Future.delayed(Duration(seconds: 2));
    return 'Call Data';
  }
}

class Info {
  final int id;
  final String userName;
  final int account;
  final int balance;

  Info(
      {required this.id,
        required this.userName,
        required this.account,
        required this.balance});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      id: json["id"],
      userName: json["userName"],
      account: json["account"],
      balance: json["balance"],
    );
  }

}