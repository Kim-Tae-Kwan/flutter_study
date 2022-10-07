import 'dart:convert';
import 'package:cardrpt/models/department.dart';
import 'package:http/http.dart' as http;

class DepartmentService {
  Uri url = Uri.https('cardrpt-dev.appplay.co.kr', 'cardrpt_0002_01_r001.jct');
  Map<String, String> headers = {
    "Cookie" : "",
    "Content-Type" : "application/x-www-form-urlencoded"
  };
  Map<String, dynamic> body = {
    "SRCH_WD": "",
    "BIZ_NO": "1078836127",
    "CYCL": "1",
    "INQY_STDD": "20220509",
    "INQY_FNDA": "20220809",
    "UNIT": "0",
    "DEPT_NM": "",
    "AMT_DSNC": "1",
    "RCPP_DSNC": "CRD_MAGR_NEW,CRD_MAGR_PRV,CRD_MAGR_TMY,CRD_MAGR_RCP,CRD_MAGR_ZER,CRD_MAGR_ETC,CRD_MAGR_ETC7,CRD_MAGR_ETC8,CRD_MAGR_ETC9",
    "OVRS_USE_YN": "A",
    "API_ID": "cardrpt_0002_01_r001"
  };

  Future<ByDept> getReport() async{
    await _getSession();

    http.Response response = await http.post(
      url,
      body: "_JSON_=${jsonEncode(body)}",
      headers: headers,
    );

    return ByDept.fromJson(jsonDecode(response.body));
  }

  _getSession() async{
    if(headers['Cookie']!.isEmpty){
      Map<String, String> query = {
        "USER_ID" : "simdemo01t",
        "USER_NM" : "심관리자",
        "PTL_ID" : "PTL_51",
        "USE_INTT_ID" : "UTLZ_1709060902735",
        "CHNL_ID" : "CHNL_1",
        "RDM_KEY" : ""
      };

      http.Response response = await http.post(
        Uri.https('cardrpt-dev.appplay.co.kr','gate/cardrpt_gate.jsp', query),
      );

      headers['Cookie'] = response.headers['set-cookie']!;
    }
  }
}