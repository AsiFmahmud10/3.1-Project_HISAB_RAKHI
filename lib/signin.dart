import 'package:flutter/material.dart';
import 'package:hisab_khata/menu.dart';

class signin extends StatelessWidget {
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
                      labelText: 'PIN',
                      border: OutlineInputBorder(),
                    ),
                    validator: emailvalidate,
                  ),
                ),
                RaisedButton(
                  child: Text("Login"),
                  color: Colors.red,
                  onPressed: () {},
                  textColor: Colors.white,
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}






/*import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 13, 58, 117),
        title: Text('signup'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.red,
          onPressed: () {},
        ),
      ),
    );
  }
}*/
