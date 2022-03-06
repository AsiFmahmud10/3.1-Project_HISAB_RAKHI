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
          backgroundColor: Color.fromARGB(255, 11, 168, 230),
          title: const Center(
            child: Text("Hisab Rakhi"),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 11, 168, 230),
          child: ListView(
            children: [
              DrawerHeader(
                child: (Container(
                  child: const Center(
                    child: Text(
                      'Hisab Rakhi',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //color: Color.fromARGB(255, 7, 145, 214),
                )),
              ),
              Divider(
                thickness: 4.0,
              ),
              ListTile(
                iconColor: Colors.white,
                leading: Icon(Icons.home),
                title: const Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                iconColor: Colors.white,
                leading: Icon(Icons.person),
                title: const Text(
                  'Customer',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                iconColor: Colors.white,
                leading: Icon(Icons.report),
                title: const Text(
                  'Report',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                iconColor: Colors.white,
                leading: Icon(Icons.settings),
                title: const Text(
                  'Setting',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(25.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Customer Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: emailvalidate,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: emailvalidate,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                    validator: emailvalidate,
                  ),
                ),
                RaisedButton(
                    color: Color.fromARGB(255, 11, 168, 230),
                    onPressed: validate,
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.0),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
