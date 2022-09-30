import 'package:flutter/material.dart';

void main() => runApp(TextDemo());

class TextDemo extends StatelessWidget{
  static const String _title= "Text 위젯 데모";
  static const String _name= "Tony Stark";
  static const String _longText= """
  기존의 Material Buttons(FlatButton, RaisedButton, OutlineButton)들이 Deprecated 되었습니다. 
  대신 새로운 MaterialButton들을 사용해야 합니다. 새로운 Material Button들(TextButton, ElevatedButton, OutlinedButton)의 탄생 목적은 
  생성자 매개 변수와 테마를 통해 버튼을보다 유연하고 쉽게 구성하는 것이 목표입니다. 기존 버튼들은 각각 스타일을 변경해주어야 했지만 이제는 ButtonStyle 단일개체를 변경시켜주면 됩니다.
  """;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: Text(_title),),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("단순 텍스트 표시"),
            Text(
              'Styled Text with $_name',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                background: Paint()
                  ..color = Color(0xFFDCEDC8)
                  ..style = PaintingStyle.fill,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              _longText,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}