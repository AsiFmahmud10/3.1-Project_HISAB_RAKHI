import 'package:flutter/material.dart';
import 'package:hisab_khata/db.dart';
import 'package:hive/hive.dart';

class DataReport extends StatefulWidget {
  const DataReport({Key? key}) : super(key: key);

  @override
  State<DataReport> createState() => _DataReportState();
}

class _DataReportState extends State<DataReport> {

  List reportData = Hive.box('reportData').values.toList();

   var data ;
   void initState() {
    super.initState();
    print('----------');
    print(reportData);
  }

  Future<dynamic> showExitPopUp(String str) {
    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Details"),
        content: Text(str),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("close"),
          ),

        ],
      );
    });
  }

    DataTable dataBody() {
    return DataTable(
      columns: [

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
        DataColumn(
          label: Text('Given'),
          numeric: false,
          tooltip: "Name",
        ),DataColumn(
          label: Text('Details'),
          numeric: false,
          tooltip: "details",
        ),
      ],
      rows: reportData
          .map((UserReoprtData) => DataRow(
                cells: [
                  DataCell(
                    Text(UserReoprtData.reportDate ?? 'null'),
                  ),
                  DataCell(
                    Text(UserReoprtData.customerDue.toString()),
                  ),
                  DataCell(
                    Text(UserReoprtData.customerGiven.toString()),
                  ),
                  DataCell(
                    Text(UserReoprtData.details.toString().substring(0,4)+'....'),
                    onTap: (){
                       showExitPopUp(UserReoprtData.details.toString());
                    }
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
    reportData = reportData.where((element) => element.customerId ==id).toList();
    print(reportData);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Center(child: Text('Report : $customerName')),
        ),
        body: dataBody());
  }
}
