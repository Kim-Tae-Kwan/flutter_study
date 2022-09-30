import 'package:flutter/material.dart';

void main() => runApp(BatteryPage());

class BatteryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BatteryPageState();
  }
}

class BatteryPageState extends State<BatteryPage> {

  _refresh(){
    print('refresh battery level');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '배터리 채널 데모 v1',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('배터리 채널 데모 v1'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('배터리 잔량 : 모름'),
              OutlinedButton(onPressed: _refresh, child: const Text('가져오기'))
            ],
          ),
        ),
      ),
    );
  }
}