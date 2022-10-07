import 'package:cardrpt/departmentService.dart';
import 'package:flutter/material.dart';
import 'package:cardrpt/models/department.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SearchResult extends StatefulWidget {

  SearchResult({Key? key}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  late ByDept _byDept;
  DepartmentService departmentService = DepartmentService();
  late DeptDataSource _deptDataSource;

  @override
  void initState() {
    super.initState();
    Future<ByDept> result = departmentService.getReport();
    result.then((value) {
      print(value.rec![0].tTCNT);
      _byDept = value;
      _deptDataSource = DeptDataSource(byDept: _byDept);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('결과'),),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: _byDept != null ? const CircularProgressIndicator() : _buildTable()
      ),
    );
  }

  _buildTable(){
    return SfDataGrid(
      source: _deptDataSource,
      columns: [
        GridColumn(
            columnName: 'cnt',
            label: Container(
                color: const Color(0xFFF1F1F1),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerRight,
                child: Text(
                  '건수',
                  overflow: TextOverflow.ellipsis,
                )
            )
        ),
        GridColumn(
            columnName: 'cash',
            label: Container(
                color: const Color(0xFFF1F1F1),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerRight,
                child: Text(
                  '금액',
                  overflow: TextOverflow.ellipsis,
                )
            )
        ),
        GridColumn(
            columnName: 'test',
            label: Container(
                color: const Color(0xFFF1F1F1),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerRight,
                child: Text(
                  '금액',
                  overflow: TextOverflow.ellipsis,
                )
            )
        ),
      ],
    );
  }

  _buildColumns(){
    List<GridColumn> list1 = [
      _buildColumn('dept', '부서', alignment: Alignment.center),
      _buildColumn('tcnt', '총 건수'),
      _buildColumn('tcash', '총 금액'),
    ];

    //List<GridColumn>.generate(length, (index) => null)
  }

  _buildColumn(String columnName, String text, {Alignment alignment = Alignment.centerRight}) {
    return GridColumn(
        columnName: columnName,
        label: Container(
            color: const Color(0xFFF1F1F1),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: alignment,
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
            )
        )
    );
  }
}

class DeptDataSource extends DataGridSource {
  List<DataGridRow> dataGridRows = [];

  DeptDataSource({required ByDept byDept}) {
    dataGridRows = byDept.rec!.map((Record record) =>
        DataGridRow(
            cells: [
              DataGridCell(columnName: 'deptName', value: record.dEPTNM),
              DataGridCell(columnName: 'ttcnt', value: record.tTCNT),
              DataGridCell(columnName: 'toamt', value: record.tOAMT),
            ]
        )).toList();
  }

  // dataGridRows = employees
  //     .map<DataGridRow>((dataGridRow) => DataGridRow(cells: [
  //   DataGridCell<int>(columnName: 'id', value: dataGridRow.id),
  //   DataGridCell<String>(columnName: 'name', value: dataGridRow.name),
  //   DataGridCell<String>(
  //       columnName: 'designation', value: dataGridRow.designation),
  //   DataGridCell<int>(
  //       columnName: 'salary', value: dataGridRow.salary),
  //   DataGridCell<String>(
  //       columnName: 'salary', value: dataGridRow.test),
  // ]))
  //     .toList();

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                dataGridCell.value.toString(),
                overflow: TextOverflow.ellipsis,
              ));
        }).toList());
  }
}