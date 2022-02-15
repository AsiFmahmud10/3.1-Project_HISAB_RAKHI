import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
             Container(
               alignment: Alignment.center,
               width: 340,
               child: TextField(
                 textAlign: TextAlign.center,
                 decoration:InputDecoration(
                   hintText: 'ENTER PIN',
                   hintStyle: TextStyle(letterSpacing:3,fontWeight: FontWeight.bold,fontSize: 17 ),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(30.0),

                   )
                 ) ,
               ),

             ),
            Container(
              width: 219,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/signup');
                  },
                    child: Row(children: [
                      Text("not signUp yet ! click to ")
                      , Spacer(),
                      Text('sign up',
                       style:TextStyle(
                         fontWeight: FontWeight.w500,
                         fontSize: 20,
                         color: Colors.blueGrey[600],

                       )
                      )
                      ],

                    )
                
                )
            ),


          ],
        ),
      ),
    );
  }
}
