

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hisab_khata/custom/_input.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],

        title: const Center(
          child: Text(
            'HISAB RAKHI',
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 336,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomInput(hint : "Email",label: 'Email',),
              CustomInput(hint : "Phone Number",label: 'Phone Number',),
              CustomInput(hint : "Pin",label: 'Pin',password: true),
              CustomInput(hint : "Confirm Pin",label: 'Confirm Pin',password: true),

              Container(
                margin: EdgeInsets.only(top:30),
                width: 150,
                height: 50,
                child: TextButton(
                    onPressed: (){},
                    child: Text("Confirm",
                    style: TextStyle(color: Colors.blueGrey),),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2,color: Colors.grey) ,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    primary: Colors.white,
                    textStyle:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                  ),
                ),


            ],
          ),
        ),
      ),
    );;
  }
}
