import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';

import '../db.dart';


class CustomerDetails{
   final String name;
   final String due;
   final String given;
  final String date;
   const CustomerDetails({
     required this.name,
     required this.due,
     required this.date,
     required this.given });

   List giveInList(){
      return [this.name,this.date,this.due,this.given];
     }
}
class PdfApi{
   late List<CustomerDetails> customersData  ;


   void fillCustomerData(List<Report> list){
     this.customersData  = list.map((e) =>
            CustomerDetails(name: e.customerName,due: e.customerDue.toString()
        ,given: e.customerGiven.toString(),date: e.reportDate)
        ).toList();

        print('customer Data : ${this.customersData}');
  }
   Future<File> generateTable()async{
      final pdf = Document();
      final headers = ['Name','Due','Given','Date'];



     pdf.addPage(Page(
       build: (contex)=> Table.fromTextArray(
         headers: headers,
         data: this.customersData.map((CustomerDetails customer)=>customer.giveInList()).toList(),
       )
     ));

      return saveDocument(name: 'customerTable', pdf: pdf);

  }

   Future openFile(File file) async{
    final url = file.path;
    await OpenFile.open(url);
  }

  Future<File> saveDocument({required String name, required Document pdf,}) async{
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    print('file path : ----- ${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;

  }

}
