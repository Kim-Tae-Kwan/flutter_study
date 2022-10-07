import 'package:cardrpt/departmentService.dart';
import 'package:cardrpt/models/department.dart';

void main() async{
  DepartmentService service = DepartmentService();
  ByDept byDept = await service.getReport();
  print(byDept.rec![0].toJson());
}