import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async{

  String url = 'jsonplaceholder.typicode.com';
  var uri = Uri.https(url, 'todos/1');

  var response = await http.get(uri);

  Map<String, dynamic> data = jsonDecode(response.body);
  print('userId : ${data['userId']}');
  print('id : ${data['id']}');
  print('title : ${data['title']}');
  print('complete : ${data['complete']}');
  print('asd : ${data['asd']}');

}