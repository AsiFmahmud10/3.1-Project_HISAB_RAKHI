import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Draer extends StatelessWidget {
  const Draer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 235, 241, 243),
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
            onTap: () {
              //Navigator.push(context, home);
              Navigator.pushNamed(context, '/home');
            },
          ),
          ListTile(
            iconColor: Colors.white,
            leading: Icon(Icons.person),
            title: const Text(
              'Add Customer',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/add');
            },
          ),
          ListTile(
            iconColor: Colors.white,
            leading: Icon(Icons.search),
            title: const Text(
              'Search Customer',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
        ],
      ),
    );
  }
}
