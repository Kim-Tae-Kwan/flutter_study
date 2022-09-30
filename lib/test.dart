void main(){
  const String _urlPrefix = 'swopenapi.seoul.go.kr';
  const String _userKey = '6c4e4d6767766f6438355068574b6e';
  const String _urlSuffix = '/json/realtimeStationArrival/0/5/';
  const String _defaultState = '광화문';

  String _response = '';

  Uri _buildUrl(String station){
    StringBuffer sb = StringBuffer();
    sb.write('/api/subway/');
    sb.write(_userKey);
    sb.write(_urlSuffix);
    sb.write(station);

    return Uri.http('swopenapi.seoul.go.kr', sb.toString());
  }

  print(_buildUrl(_defaultState).toString());
}

