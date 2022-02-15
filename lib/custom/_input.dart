import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String hint;
  final String label;
  bool password ;

   CustomInput({Key? key, required this.hint,required this.label,this.password=false}) : super(key: key);

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {



  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top:2.3,bottom: 2.3),
        child: TextField(
          obscureText: widget.password,
          cursorColor: Colors.blueGrey[800],
          textAlign: TextAlign.left,
          decoration:InputDecoration(
             label: Text("${widget.label}"),
              labelStyle: TextStyle(color: Colors.blueGrey[800]),
              hintText: widget.hint,
              hintStyle: TextStyle(letterSpacing:3,fontSize: 17 ),
              border: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
          ) ,
        ),
    );
  }
}
