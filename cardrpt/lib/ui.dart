import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatefulWidget()
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  //select box
  final _valueList = ['first', 'second', 'third'];
  var _selectedValue = 'first';

  //check box
  bool isChecked = false;

  var _selectedTime;


  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Checkbox(
          checkColor: Colors.white,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),

        DropdownButton(
          value: _selectedValue,
          items: _valueList.map((value) {
            return DropdownMenuItem(child: Text(value), value: value,);
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedValue = value!;
            });
          },
        ),

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

            selectedDate.then(
                (dateTime) {
                  setState(() {
                    _selectedTime = dateTime;
                  });
                }
            );
          },
          child: Text('Date Picker'),
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              DataColumn(label: Text('이름')),
              DataColumn(label: Text('이름')),
              DataColumn(label: Text('이름')),
              DataColumn(label: Text('이름')),
              DataColumn(label: Text('이름')),
              DataColumn(label: Text('이름')),
              DataColumn(label: Text('이름')),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text('row')),
                  DataCell(Text('row')),
                  DataCell(Text('row')),
                  DataCell(Text('row')),
                  DataCell(Text('row')),
                  DataCell(Text('row')),
                  DataCell(Text('row')),
                ]
              )
            ],
          ),
        )



      ]

    );
  }
}
