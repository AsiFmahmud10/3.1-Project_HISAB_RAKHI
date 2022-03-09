

import 'package:flutter/material.dart';
import 'package:hisab_khata/db.dart';
import 'package:hive/hive.dart';

class AddCustomer extends StatelessWidget {
  get child => null;

  final customerNameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();


  @override
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool validate() {
    if (formkey.currentState!.validate()) {
      Hive.box('customerData').add(Customer(customerName: nameController.text,
          customerEmail: emailController.text,
          customerPhone: phoneController.text));
      print('Ok');
      return true;
    } else {
      return false;
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
    return Scaffold(
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
      body: WillPopScope(
        onWillPop: ()async{
           Navigator.pop(context,false);
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
                    controller: nameController,
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
                    controller: emailController,
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
                    controller: phoneController,
                    decoration: const InputDecoration(

                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                    validator: emailvalidate,
                  ),
                ),
                RaisedButton(
                    color: Color.fromARGB(255, 11, 168, 230),
                    onPressed:() {
                      bool temp = validate();
                      if(temp){
                        Navigator.pushNamed(context, '/');
                      }

                },
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