import 'package:flutter/material.dart';
import 'package:hisab_khata/user_report_data.dart';

class DataReport extends StatefulWidget {
  const DataReport({Key? key}) : super(key: key);

  @override
  State<DataReport> createState() => _DataReportState();
}

class _DataReportState extends State<DataReport> {
  late List<UserReoprtData> user;

  void initState() {
    user = UserReoprtData.getUsers();
    super.initState();
  }

  DataTable dataBody() {
    return DataTable(
      columns: [
        DataColumn(
          label: Text('Name'),
          numeric: false,
          tooltip: "Name",
        ),
        DataColumn(
          label: Text('Due'),
          numeric: false,
          tooltip: "Due",
        ),
        DataColumn(
          label: Text('Deposit'),
          numeric: false,
          tooltip: "Deposit",
        ),
        DataColumn(
          label: Text('Name'),
          numeric: false,
          tooltip: "Name",
        ),
      ],
      rows: user
          .map((UserReoprtData) => DataRow(
                cells: [
                  DataCell(
                    Text(UserReoprtData.name),
                  ),
                  DataCell(
                    Text(UserReoprtData.Due.toString()),
                  ),
                  DataCell(
                    Text(UserReoprtData.deposit.toString()),
                  ),
                  DataCell(
                    Text(UserReoprtData.date),
                  ),
                ],
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Report")),
        ),
        body: dataBody());
  }
}
