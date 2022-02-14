import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(
          child: Text(
            'Hisab Rakhi',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300.0,
              height: 100.0,
              child: RaisedButton(
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.red,
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: 300.0,
              height: 100.0,
              child: RaisedButton(
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20),
                ),
                color: Colors.red,
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*


  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => signup()),
                  );





 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => signup()),
                  );


*/