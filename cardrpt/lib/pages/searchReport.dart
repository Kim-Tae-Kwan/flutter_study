import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          _buildForm(),
          _buildTable()
        ],
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
        )
        

      ],
    );
  }
  _buildTable(){
    return const SizedBox();
  }

}
