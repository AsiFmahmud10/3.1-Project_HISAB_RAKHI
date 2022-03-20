import 'package:flutter/material.dart';

class menu extends StatelessWidget {
  const menu({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: const Center(
          child: Text(
            'Hisab Rakhi',
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor:Color.fromARGB(255, 11, 168, 230),
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
                    color: Colors.white
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
                  fontSize: 18,
                    color: Colors.white,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Overall Sell',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 251, 254, 255),
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: EdgeInsets.all(10.0),
                          minimumSize: Size(120, 100),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0))),
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Overall Due',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.all(10.0),
                          minimumSize: Size(120, 100),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0))),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 6.0,
              ),
              Container(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text(
                      'Customer',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      padding: EdgeInsets.all(6.0),
                      minimumSize: Size(350, 120),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
