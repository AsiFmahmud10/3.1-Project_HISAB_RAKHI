import 'package:flutter/material.dart';
import 'package:hisab_khata/db.dart';
import 'package:hisab_khata/dbclass.dart';
import 'package:hive/hive.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Box userData;
  late String showInfo =' ' ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
void inputData(){

}

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
      body:FutureBuilder(
        future: Hive.openBox('userData'),
        builder: (context,AsyncSnapshot<Box> snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError){
              return Center(
                child: Text("DB ERROR"),
              );
            }else{
              userData  = snapshot.data!;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(showInfo),
                    Text(userData.get(0).pin ),//----------------------------------------,
                    Container(
                      alignment: Alignment.center,
                      width: 340,
                      child: TextField(
                        onSubmitted: (submittedPin){
                           print(submittedPin);
                          if(submittedPin == userData.get(0).pin){//------------------------
                            setState(() {
                              showInfo = "Ok";
                            });
                          }else{
                            setState(() {
                              showInfo = "Invalid Pin";
                            });
                          }
                          inputData();

                        },
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
              );
            }
          }else{
             return Container();
          }
        },
      )
    );
  }
}
