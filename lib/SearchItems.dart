import 'package:hive/hive.dart';

import 'db.dart';
import 'package:flutter/material.dart';

List<Customer> customerDetails = [

];

class CustomerDetails extends StatefulWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  _CustomerDetailsState createState() => _CustomerDetailsState();
}

class _CustomerDetailsState extends State<CustomerDetails> {
  late Box customerData = Hive.box('customerData');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();




  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



/*
*  Customer(name: "Abish", tk: 106),
  Customer(name: "Bob", tk: 267),
  Customer(name: "Charlie", tk: 773),
  Customer(name: "Dany", tk: 476),
  Customer(name: "Esha", tk: 565),
  Customer(name: "Fizel", tk: 6456),
  Customer(name: "Gayathri", tk: 67),
  Customer(name: "Hendry", tk: 866),
  Customer(name: "Ishya", tk: 669),
*
* */