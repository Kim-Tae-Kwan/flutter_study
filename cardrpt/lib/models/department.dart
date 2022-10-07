class ByDept {
  String? cycl;
  List<Record>? rec;
  String? bizNo;
  String? unit;
  CommonHead? commonHead;
  String? searchEnd;
  String? tcamt;
  String? searchStart;
  String? totalCount;

  ByDept(
      {this.cycl,
        this.rec,
        this.bizNo,
        this.unit,
        this.commonHead,
        this.searchEnd,
        this.tcamt,
        this.searchStart,
        this.totalCount});

  ByDept.fromJson(Map<String, dynamic> json) {
    cycl = json['CYCL'];
    if (json['REC'] != null) {
      rec = <Record>[];
      json['REC'].forEach((v) {
        rec!.add(Record.fromJson(v));
      });
    }
    bizNo = json['BIZ_NO'];
    unit = json['UNIT'];
    commonHead = json['COMMON_HEAD'] != null
        ? CommonHead.fromJson(json['COMMON_HEAD'])
        : null;
    searchEnd = json['INQY_FNDA'];
    tcamt = json['TOAMT'];
    searchStart = json['INQY_STDD'];
    totalCount = json['TTCNT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CYCL'] = this.cycl;
    if (this.rec != null) {
      data['REC'] = this.rec!.map((v) => v.toJson()).toList();
    }
    data['BIZ_NO'] = this.bizNo;
    data['UNIT'] = this.unit;
    if (this.commonHead != null) {
      data['COMMON_HEAD'] = this.commonHead!.toJson();
    }
    data['INQY_FNDA'] = this.searchEnd;
    data['TOAMT'] = this.tcamt;
    data['INQY_STDD'] = this.searchStart;
    data['TTRecord'] = this.totalCount;
    return data;
  }
}

class Record {
  List<REC2>? rEC2;
  String? tOAMT;
  String? dEPTNM;
  String? tTCNT;

  Record({this.rEC2, this.tOAMT, this.dEPTNM, this.tTCNT});

  Record.fromJson(Map<String, dynamic> json) {
    if (json['REC2'] != null) {
      rEC2 = <REC2>[];
      json['REC2'].forEach((v) {
        rEC2!.add(new REC2.fromJson(v));
      });
    }
    tOAMT = json['TOAMT'];
    dEPTNM = json['DEPT_NM'];
    tTCNT = json['TTCNT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rEC2 != null) {
      data['REC2'] = this.rEC2!.map((v) => v.toJson()).toList();
    }
    data['TOAMT'] = this.tOAMT;
    data['DEPT_NM'] = this.dEPTNM;
    data['TTCNT'] = this.tTCNT;
    return data;
  }
}

class REC2 {
  String? lVL;
  String? cNT;
  String? aMT;

  REC2({this.lVL, this.cNT, this.aMT});

  REC2.fromJson(Map<String, dynamic> json) {
    lVL = json['LVL'];
    cNT = json['CNT'];
    aMT = json['AMT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LVL'] = lVL;
    data['CNT'] = cNT;
    data['AMT'] = aMT;
    return data;
  }
}

class CommonHead {
  String? mESSAGE;
  String? cODE;
  bool? eRROR;

  CommonHead({this.mESSAGE, this.cODE, this.eRROR});

  CommonHead.fromJson(Map<String, dynamic> json) {
    mESSAGE = json['MESSAGE'];
    cODE = json['CODE'];
    eRROR = json['ERROR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['MESSAGE'] = mESSAGE;
    data['CODE'] = cODE;
    data['ERROR'] = eRROR;
    return data;
  }
}

class DeptRequest {
  String? searchWord;
  String? bizNo;
  String? cycl;
  String? searchStart;
  String? searchEnd;
  String? unit;
  String? deptName;
  String? amt;
  String? rcppDsnc;
  String? overUse;
  String? apiId;

  DeptRequest(
      {this.searchWord,
        this.bizNo,
        this.cycl,
        this.searchStart,
        this.searchEnd,
        this.unit,
        this.deptName,
        this.amt,
        this.rcppDsnc,
        this.overUse,
        this.apiId});

  DeptRequest.fromJson(Map<String, dynamic> json) {
    searchWord = json['SRCH_WD'];
    bizNo = json['BIZ_NO'];
    cycl = json['CYCL'];
    searchStart = json['INQY_STDD'];
    searchEnd = json['INQY_FNDA'];
    unit = json['UNIT'];
    deptName = json['DEPT_NM'];
    amt = json['AMT_DSNC'];
    rcppDsnc = json['RCPP_DSNC'];
    overUse = json['OVRS_USE_YN'];
    apiId = json['API_ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['SRCH_WD'] = searchWord;
    data['BIZ_NO'] = bizNo;
    data['CYCL'] = cycl;
    data['INQY_STDD'] = searchStart;
    data['INQY_FNDA'] = searchEnd;
    data['UNIT'] = unit;
    data['DEPT_NM'] = deptName;
    data['AMT_DSNC'] = amt;
    data['RCPP_DSNC'] = rcppDsnc;
    data['OVRS_USE_YN'] = overUse;
    data['API_ID'] = apiId;
    return data;
  }
}
