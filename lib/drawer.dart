import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Draer extends StatelessWidget {
  const Draer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      child: ListView(
        children: [
          DrawerHeader(
            child: (Container(
              child: const Center(
                child: Text(
                  'Hisab Rakhi',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              //color: Color.fromARGB(255, 7, 145, 214),
            )),
          ),
          Divider(
            thickness: 4.0,
            color: Colors.redAccent,
          ),
          ListTile(
            iconColor: Colors.blueGrey,
            leading: Icon(Icons.home),
            title: const Text(
              'Home',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey,
              ),
            ),
            onTap: () {
              //Navigator.push(context, home);
              Navigator.pushNamed(context, '/menu');
            },
          ),
          ListTile(
            iconColor: Colors.blueGrey,
            leading: Icon(Icons.person),
            title: const Text(
              'Add Customer',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/add');
            },
          ),
          ListTile(
            iconColor: Colors.blueGrey,
            leading: Icon(Icons.search),
            title: const Text(
              'Search Customer',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
