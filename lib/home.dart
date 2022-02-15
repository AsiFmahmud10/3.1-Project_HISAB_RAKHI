import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 20,color: Colors.blueGrey),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 23),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    )
              ),

              ),

      Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          child: const Text(
            'Sign In',
            style: TextStyle(fontSize: 20,color: Colors.blueGrey),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/signin');
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 23),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )
          ),

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