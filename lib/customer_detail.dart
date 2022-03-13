import 'package:flutter/material.dart';

class CustomerDetail extends StatelessWidget {
  get child => null;

  final customerDue = TextEditingController();
  final get = TextEditingController();
  final description = TextEditingController();

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 168, 230),
        title: const Center(
          child: Text("Customer name"),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Report'),
            style: TextButton.styleFrom(
              textStyle: TextStyle(fontSize: 20),
              primary: Colors.white,
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
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
                    controller: get,
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
                    controller: customerDue,
                    decoration: const InputDecoration(
                      labelText: 'Due',
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
                RaisedButton(
                    color: Color.fromARGB(255, 11, 168, 230),
                    onPressed: () {},
                    child: const Text(
                      "Confirm",
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
