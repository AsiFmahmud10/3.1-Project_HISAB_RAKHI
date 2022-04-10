import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
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


  TextStyle _TextStyle(){
      return TextStyle(fontWeight: FontWeight.bold,
          fontSize: 23,
          color: Colors.blueGrey,
          fontFamily: 'Lato'
      );

  }


  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments ;
    print('data : $data');
    Customer customer =  customerData.where((element) => element.key==data['customer_id']).toList()[0] ;
    print(customer);
    print(data['customer_id'].runtimeType);
    return Scaffold(
      appBar: AppBar(
        title: Center(child : Text("Customer Details")),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,

            ),
          Text('Name : ${customer.customerName}',
          style:_TextStyle(),
            ),

            SizedBox(
              height: 20,
            ),


            Text('Email : ${customer.customerEmail}',
              style:_TextStyle(),
            ),
            SizedBox(
              height: 20,
            ),

            SizedBox(
              width: 170,
              height: 45,
              child: ElevatedButton.icon(onPressed: ()async{
                FlutterPhoneDirectCaller.callNumber(customer.customerPhone.toString());
              }, icon: Icon(Icons.call_end_rounded,
              color: Colors.white,), label: Text('CALL'),
                style:ElevatedButton.styleFrom(

                  )
                )



              ),



SizedBox(
  height: 300,
),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
                SizedBox(
                  width: 140,
                  height: 40,
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, '/customerDetails',
                        arguments: {
                          'customer_id': data['customer_id'],
                          'customerName': data['customerName']

                          //ModalRoute.of(context)?.settings.arguments;
                        });
                  },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.blue[400])
                      ),
                      child: Text("ADD HISAB")),

                ),
               SizedBox(
                 width: 140,
                 height: 40,
                 child: ElevatedButton(onPressed: (){
                   Navigator.pushReplacementNamed(context, '/report_table',
                       arguments: {
                         'id': data['customer_id'],
                         'name': data['customerName']

                         //ModalRoute.of(context)?.settings.arguments;
                       });

                 },
                     style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all(Colors.red[400])
                     ),
                     child: Text("REPORT")),
               )

             ]
           ),
         ],
        ),
      ),
    );
  }
}
