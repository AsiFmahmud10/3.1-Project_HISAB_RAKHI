import 'package:flutter/material.dart';
import 'package:hisab_khata/drawer.dart';
import 'package:hive/hive.dart';

import 'db.dart';

class CustomerDetail extends StatefulWidget {
  @override
  State<CustomerDetail> createState() => _CustomerDetailState();
}

class _CustomerDetailState extends State<CustomerDetail> {
  get child => null;

  var data;
  final customerGiven = TextEditingController(text:'');

  final deposit = TextEditingController(text:'');

  final description = TextEditingController();
  Box reportDb = Hive.box('reportData');


  @override
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool validate() {
    if (formkey.currentState!.validate()) {
      print('---------------');
        if(customerGiven.text.length == 0){
          customerGiven.text ='0';
        }
        if(deposit.text.length == 0){
          deposit.text = '0';
        }

        int customerDue = int.parse(customerGiven.text) - int.parse(deposit.text);

       reportDb.put(data['customer_id'], Report(
           reportDate:DateTime.now().toString().substring(0,10),
           details: description.text,
           customerGiven:int.parse(deposit.text),
           customerDue:customerDue,
           customerName:data['customerName'],
           customerId: data['customer_id'],
       ));
      print(reportDb.values.toList());
      print('Ok');
      return true;
    } else {
      print('required');
      return false;
    }
  }

  String? emailvalidate(val) {
    if (val == null || val.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  }




  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments ;
    print(data);
    //print(reportDb.toString());
    print(reportDb.values.toList());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title:  Center(
          child: Text(data['customerName']),
        ),
        actions: [
          SizedBox(

            width: 100,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context,'/showRepot',arguments: {
                  'id' :data['customer_id'],
                  'name' : data['customerName']
                } );
              },
              child: Text('REPORT'),
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                primary: Colors.white,
                backgroundColor: Color.fromRGBO(
                    227, 224, 224, 0.2627450980392157),
              ),
            ),
          ),
        ],
      ),
     drawer: Draer(),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: TextFormField(
                    controller: deposit,
                    decoration: const InputDecoration(
                      labelText: 'Get',
                      border: OutlineInputBorder(),
                    ),
                    validator: emailvalidate,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: TextFormField(
                    controller: customerGiven,
                    decoration: const InputDecoration(
                      labelText: 'Value',
                      border: OutlineInputBorder(),
                    ),
                    validator: emailvalidate,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: TextFormField(
                    controller: description,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                    validator: emailvalidate,
                  ),
                ),
                SizedBox(
                  width: 160,
                  height: 50,
                  child: RaisedButton(

                      color: Color.fromRGBO(2, 2,2, 2.0),
                      onPressed: () {
                        if(validate()){
                            Navigator.pushNamed(context, '/');
                        }
                      },
                      child: const Text(
                        "Confirm",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
