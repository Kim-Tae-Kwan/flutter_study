import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(SubwayDemo());

class SubwayDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '지하철 실시간 정보',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget{
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage>{
  static const String _urlPrefix = 'swopenapi.seoul.go.kr';
  static const String _userKey = '6c4e4d6767766f6438355068574b6e';
  static const String _urlSuffix = '/json/realtimeStationArrival/0/5/';
  static const String _defaultState = '광화문';

  String _response = '';

  Uri _buildUrl(String station){
    StringBuffer sb = StringBuffer();
    sb.write('/api/subway/');
    sb.write(_userKey);
    sb.write(_urlSuffix);
    sb.write(station);

    return Uri.http('swopenapi.seoul.go.kr', sb.toString());
  }

  _httpGet() async {
    var response = await http.get(_buildUrl(_defaultState));
    String res = response.body;
    print('res >> $res');
    setState(() {
      _response = res;
    });
  }


  @override
  void initState() {
    super.initState();
    _httpGet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('지하철 실시간 정보'),),
      body: Center(
        child: Text(_response),
      ),
    );
  }
}
