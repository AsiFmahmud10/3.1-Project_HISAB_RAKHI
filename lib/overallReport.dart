import 'package:flutter/material.dart';
import 'package:hisab_khata/db.dart';
import 'package:hive/hive.dart';

class OverAllReport extends StatefulWidget {
  const OverAllReport({Key? key}) : super(key: key);

  @override
  State<OverAllReport> createState() => _OverAllDataReportState();
}

class _OverAllDataReportState extends State<OverAllReport> {

  List reportData = Hive.box('reportData').values.toList();

  var data ;
  void initState() {
    super.initState();
    print('----------');
    print(reportData);
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
          label: Text('Date'),
          numeric: false,
          tooltip: "Due",
        ),
        DataColumn(
          label: Text('Due'),
          numeric: false, 
          tooltip: "Deposit",
        ),

      ],
      rows: reportData
          .map((UserReoprtData) => DataRow(
        cells: [
          DataCell(
            Text(UserReoprtData.reportDate ?? 'null'),
          ),
          DataCell(
            Text(UserReoprtData.customerDue.toString()  ?? 'null'),
          ),
          DataCell(
            Text(UserReoprtData.customerGiven.toString() ?? 'null' ),
          ),

        ],
      ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {

    data =  ModalRoute.of(context)!.settings.arguments ;
    print(data);
    String customerName = data['name'] ;
    String id = data['id'].toString();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Center(child: Text('Report : $customerName')),
        ),
        body: dataBody());
  }
}
