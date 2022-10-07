import 'package:cardrpt/test.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum division {
  total,
  cash,
  tcnt
}

extension DivisionExtension on division {
  String get value {
    switch(this){
      case division.total:
        return "0";
      case division.cash:
        return "1";
      case division.tcnt:
        return "2";
      default:
        return "";
    }
  }
}

class searchReport extends StatefulWidget {
  const searchReport({Key? key}) : super(key: key);

  @override
  State<searchReport> createState() => _searchReportState();
}

class _searchReportState extends State<searchReport> {
  //select box
  final _business = ['전체', '비즈플레이'];
  var _selectedBusiness = '전체';

  final _conditions = ['전체', '용도', '카드번호', '사용자', '사용자-용도'];
  var _selectedCondition = '전체';

  final _department = ['전체', '용도', '카드번호', '사용자', '사용자-용도'];
  var _selectedDepartment = '전체';

  //check box
  bool isChecked = false;

  //radio
  division? _character = division.total;

  //date picker
  var _selectedTime;


  @override
  void initState() {
    super.initState();
    _selectedTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('카드보고서'),),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            _buildForm(),
          ],
        ),
      ),
    );
  }

  _buildForm(){
    return Column(
      children: [
        Row(
          children: [
            Text('사업장'),
            SizedBox(width: 20,),
            DropdownButton(
              value: _selectedBusiness,
              items: _business.map((value) {
                return DropdownMenuItem(child: Text(value), value: value,);
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedBusiness = value!;
                });
              },
            ),


            SizedBox(width: 20,),

            Text('상세조건'),
            SizedBox(width: 20,),
            DropdownButton(
              value: _selectedCondition,
              items: _conditions.map((value) {
                return DropdownMenuItem(child: Text(value), value: value,);
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCondition = value!;
                });
              },
            )

          ],
        ),

        Row(
          children: [
            Text('부서'),
            SizedBox(width: 20,),
            DropdownButton(
              value: _selectedCondition,
              items: _conditions.map((value) {
                return DropdownMenuItem(child: Text(value), value: value,);
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCondition = value!;
                });
              },
            )

          ],
        ),

        Row(
          children: [
            Text('구분'),
            
            Container(
              child: Row(
                children: [
                  Radio<division>(
                    value: division.total,
                    groupValue: _character,
                    onChanged: (division? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  Text('전체')
                ],
              ),
            ),

            Container(
              child: Row(
                children: [
                  Radio<division>(
                    value: division.cash,
                    groupValue: _character,
                    onChanged: (division? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  Text('금액')
                ],
              ),
            ),

            Container(
              child: Row(
                children: [
                  Radio<division>(
                    value: division.tcnt,
                    groupValue: _character,
                    onChanged: (division? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  Text('건수')
                ],
              ),
            ),
          ],
        ),
        
        Row(
          children: [
            Text('영수증구분'),
            Container(
              child: Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text('전체'),
                ]
              ),
            ),
            Container(
              child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text('법인카드'),
                  ]
              ),
            ),
            Container(
              child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text('개인카드'),
                  ]
              ),
            ),



          ],
        ),

        Row(
          children: [
            Container(
              child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text('티머니카드'),
                  ]
              ),
            ),
            Container(
              child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text('현금영수증'),
                  ]
              ),
            ),
            Container(
              child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text('제로페이'),
                  ]
              ),
            ),



          ],
        ),

        Row(
          children: [
            Container(
              child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text('기타간이'),
                  ]
              ),
            ),
            Container(
              child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text('유류비'),
                  ]
              ),
            ),
            Container(
              child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text('교통비'),
                  ]
              ),
            ),
            Container(
              child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text('출장비'),
                  ]
              ),
            )
          ],
        ),

        Row(
          children: [
            Text('금액구분'),

            Container(
              child: Row(
                children: [
                  Radio<division>(
                    value: division.total,
                    groupValue: _character,
                    onChanged: (division? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  Text('사용금액')
                ],
              ),
            ),

            Container(
              child: Row(
                children: [
                  Radio<division>(
                    value: division.cash,
                    groupValue: _character,
                    onChanged: (division? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  Text('신청금액')
                ],
              ),
            ),

            Container(
              child: Row(
                children: [
                  Radio<division>(
                    value: division.tcnt,
                    groupValue: _character,
                    onChanged: (division? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  Text('공급가액')
                ],
              ),
            ),
          ],
        ),

        Row(
          children: [
            Text('해외사용'),
            Container(
              child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text('국내'),
                  ]
              ),
            ),
            Container(
              child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text('해외'),
                  ]
              ),
            ),
          ],
        ),

        Row(
          children: [
            Text('조회기간'),
            TextButton(
              onPressed: (){
                Future<DateTime?> selectedDate = showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2018),
                  lastDate: DateTime(2030),
                  builder: (BuildContext context, Widget? child){
                    return Theme(
                      data: ThemeData.dark(),
                      child: child!,
                    );
                  },
                );

                selectedDate.then((dateTime) {
                  if(dateTime != null){
                    setState(() {
                      _selectedTime = dateTime;
                    });
                  }
                });
              },
              child: Text(DateFormat('yyyyMMdd').format(_selectedTime)),
            ),
            Text('~'),
            TextButton(
              onPressed: (){
                Future<DateTime?> selectedDate = showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2018),
                  lastDate: DateTime(2030),
                  builder: (BuildContext context, Widget? child){
                    return Theme(
                      data: ThemeData.dark(),
                      child: child!,
                    );
                  },
                );

                selectedDate.then((dateTime) {
                  if(dateTime != null){
                    setState(() {
                      _selectedTime = dateTime;
                    });
                  }
                }
                );
              },
              child: Text(DateFormat('yyyyMMdd').format(_selectedTime)),
            ),
          ],
        ),
        
        SizedBox(
          width: double.infinity,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue

            ),
            onPressed: () {
              Navigator.pushNamed(context, '/result');
              print('조회');
            },
            child: Text(
              '조회',
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
        ),
      ],
    );
  }


}
