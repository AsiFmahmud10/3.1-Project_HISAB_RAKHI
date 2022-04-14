import 'package:flutter/material.dart';
import 'package:hisab_khata/custom/pdfApi.dart';
import 'package:hisab_khata/db.dart';
import 'package:hive/hive.dart';

class DataReport extends StatefulWidget {
  const DataReport({Key? key}) : super(key: key);

  @override
  State<DataReport> createState() => _DataReportState();
}

class _DataReportState extends State<DataReport> {

  List reportData = Hive.box('reportData').values.toList();
  late List <Report> modfiData ;


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
          label: Text('Date')),
        DataColumn(
          label: Text('Due')),
        DataColumn(
          label: Text('Given'),

        ),DataColumn(
          label: Text('Details'),
        ),
      ],
      rows: modfiData.map((Report UserReoprtData) => DataRow(

                cells: [
                  DataCell(
                    Text(UserReoprtData.reportDate), // ??
                  ),
                  DataCell(
                    Text(UserReoprtData.customerDue.toString()),
                  ),
                  DataCell(
                    Text(UserReoprtData.customerGiven.toString()),
                  ),
                  DataCell(
                    Text(UserReoprtData.details.toString().substring(0,2)+'..'),
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
   modfiData = List<Report>.from(reportData.where((element) => element.customerId ==id).toList());

   Future fillData()async{

     PdfApi pdfApi = PdfApi();
     pdfApi.fillCustomerData(modfiData);
     var pfdFile = await pdfApi.generateTable();
     await pdfApi.openFile(pfdFile);
   }



    print('--------ufff------------');
    print(modfiData);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Center(child: Text('Report : $customerName')),

        ),
        body:Column(
          children: [
            ElevatedButton.icon(
                onPressed: () async{
                   await fillData();

                },
                icon: Icon(Icons.save), label: Text('asd')),
            dataBody(),
          ],
        )
    );
  }
}
