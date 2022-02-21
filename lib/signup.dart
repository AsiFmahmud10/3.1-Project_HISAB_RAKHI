import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  get child => null;

  @override
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState!.validate()) {
      print('Ok');
    } else {
      print('required');
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 226, 64, 53),
          title: const Center(
            child: Text("Hisab Rakhi"),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Store Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: emailvalidate,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: emailvalidate,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'PIN',
                      border: OutlineInputBorder(),
                    ),
                    validator: emailvalidate,
                  ),
                ),
                Expanded(
                    child: Container(
                  height: 10,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Confirm PIN',
                      border: OutlineInputBorder(),
                    ),
                    validator: emailvalidate,
                  ),
                )),
                RaisedButton(
                  color: Colors.red,
                  onPressed: validate,
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
