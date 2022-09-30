import 'package:http/http.dart' as http;

void main() async {

  var url = Uri.https('jsonplaceholder.typicode.com', 'todos/1');
  //String url = 'https://jsonplaceholder.typicode.com/todos/1';
  http.Response resp = await http.get(url);
  print('status = ${resp.statusCode}');
  print('response = ${resp.body}');

}