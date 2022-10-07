import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() => runApp(const App());

class Employee {
  late final int _id;
  late final String _name;
  late final String _designation;
  late final int _salary;
  late final String _test;


  Employee(this._id, this._name, this._designation, this._salary, this._test);

  String get test => _test;

  set test(String value) {
    _test = value;
  }

  int get salary => _salary;

  set salary(int value) {
    _salary = value;
  }

  String get designation => _designation;

  set designation(String value) {
    _designation = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}

class EmployeeDataSource extends DataGridSource {
  List<DataGridRow> dataGridRows = [];

  EmployeeDataSource({required List<Employee> employees}) {
    dataGridRows = employees
        .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
      DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
      DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
      DataGridCell<String>(
          columnName: 'designation', value: dataGridRow.designation),
      DataGridCell<int>(
          columnName: 'salary', value: dataGridRow.salary),
      DataGridCell<String>(
          columnName: 'salary', value: dataGridRow.test),
    ]))
        .toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
              alignment: (dataGridCell.columnName == 'id' ||
                  dataGridCell.columnName == 'salary')
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                dataGridCell.value.toString(),
                overflow: TextOverflow.ellipsis,
              ));
        }).toList());
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late EmployeeDataSource _employeeDataSource;
  List<Employee> _employees = <Employee>[];

  @override
  void initState() {
    super.initState();
    _employees = getEmployeeData();
    _employeeDataSource = EmployeeDataSource(employees: _employees);
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000,"a"),
      Employee(10002, 'Kathryn', 'Manager', 30000,"a"),
      Employee(10003, 'Lara', 'Developer', 15000,"a"),
      Employee(10004, 'Michael', 'Designer', 15000,"a"),
      Employee(10005, 'Martin', 'Developer', 15000,"a"),
      Employee(10006, 'Newberry', 'Developer', 15000,"a"),
      Employee(10007, 'Balnc', 'Developer', 15000,"a"),
      Employee(10008, 'Perry', 'Developer', 15000,"a"),
      Employee(10009, 'Gable', 'Developer', 15000,"a"),
      Employee(10009, 'Gable', 'Developer', 15000,"a"),
      Employee(10009, 'Gable', 'Developer', 15000,"a"),
      Employee(10009, 'Gable', 'Developer', 15000,"a"),
      Employee(10009, 'Gable', 'Developer', 15000,"a"),
      Employee(10009, 'Gable', 'Developer', 15000,"a"),
      Employee(10009, 'Gable', 'Developer', 15000,"a"),
      Employee(10010, 'Grimes', 'Developer', 15000,"a")
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('test'),),
        body: SfDataGrid(
          source: _employeeDataSource,
          columns: [
            GridColumn(
                columnName: 'id',
                label: Container(
                    color: const Color(0xFFF1F1F1),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'ID',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                columnName: 'name',
                label: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Name',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                columnName: 'designation',
                label: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Designation',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                columnName: 'salary',
                label: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Salary',
                      overflow: TextOverflow.ellipsis,
                    ))),
            GridColumn(
                columnName: 'salary',
                label: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Salary',
                      overflow: TextOverflow.ellipsis,
                    ))),
          ],
          stackedHeaderRows: [
            StackedHeaderRow(
              cells: [
                StackedHeaderCell(
                  columnNames: ['salary','name'],
                  child: Container(
                    color: const Color(0xFFF1F1F1),
                    child: Center(child: Text('test')),
                  )
                )
              ]
            )
          ],
        ),
      ),
    );
  }


}

