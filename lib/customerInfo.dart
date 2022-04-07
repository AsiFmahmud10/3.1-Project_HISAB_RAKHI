import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hisab_khata/Controller/customerdetailsContoller.dart';
import 'package:hive/hive.dart';

import 'db.dart';

class CustomerInfo extends StatefulWidget {
  const CustomerInfo({Key? key}) : super(key: key);



  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {

  List<Customer> customerData = List<Customer>.from(Hive.box('customerData').values.toList());
  var data;


  Widget _Text(String txt){
      return Text(txt,
      style:TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30
      ),
      );

  }


  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments ;
    var customer =  customerData.where((element) => element.key==data['id']).toList() ;
    print(customerData[0].customerName);
    return Scaffold(
      appBar: AppBar(
        title: Center(child : Text("Customer Details")),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        Text('Name : ',
        style:TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
        ),
      ),
          Text('Email : ${'customer.customerEmail'}',
            style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
            ),
          ),
          Text('Phone : ${'customer.customerPhone'}',
            style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
            ),
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
              SizedBox(
                width: 140,
                height: 40,
                child: ElevatedButton(onPressed: (){
                },
                    child: Text("REPORT")),
              ),
             SizedBox(
               width: 140,
               height: 40,
               child: ElevatedButton(onPressed: (){
               },
                   child: Text("ADD HISAB")),
             )

           ]
         ),
       ],
      ),
    );
  }
}
