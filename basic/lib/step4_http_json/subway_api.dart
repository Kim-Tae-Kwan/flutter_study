import 'package:http/http.dart' as http;
import 'dart:convert';

const String _urlPrefix = 'swopenapi.seoul.go.kr';
const String _userKey = '6c4e4d6767766f6438355068574b6e';
const String _urlSuffix = '/json/realtimeStationArrival/0/5/';
const String defaultState = '광화문';

const int STATUS_OK = 200;

Uri buildUrl(String station){
  StringBuffer sb = StringBuffer();
  sb.write('/api/subway/');
  sb.write(_userKey);
  sb.write(_urlSuffix);
  sb.write(station);

  return Uri.http('swopenapi.seoul.go.kr', sb.toString());
}

// _httpGet() async {
//   var response = await http.get(buildUrl(defaultState));
//   String responseBody = response.body;
//   print('res >> $responseBody');
//
//   var json =  jsonDecode(responseBody);
//   Map<String, dynamic> errorMessage = json['errorMessage'];
//
//   if(errorMessage['status'] != STATUS_OK){
//     setState(() {
//       final String errMessage = errorMessage['message'];
//       _rowNum = -1;
//       _subwayId = '';
//       _trainLineNm = '';
//       _subwayHeading = '';
//       _arvlMsg2 = errMessage;
//     });
//     return;
//   }
//
//   List<dynamic> realtimeArrivalList = json['realtimeArrivalList'];
//   final int cnt = realtimeArrivalList.length;
//
//   List<SubwayArrival> list = List.generate(cnt, (index) {
//     Map<String, dynamic> item = realtimeArrivalList[index];
//     return SubwayArrival(
//         item['rowNum'],
//         item['subwayId'],
//         item['trainLineNm'],
//         item['subwayHeading'],
//         item['arvlMsg2']
//     );
//   });
//
//   SubwayArrival first = list[0];
//
//   setState(() {
//     _rowNum = first.rowNum;
//     _subwayId = first.subwayId;
//     _trainLineNm = first.trainLineNm;
//     _subwayHeading = first.subwayHeading;
//     _arvlMsg2 = first._arvlMsg2;
//   });
// }