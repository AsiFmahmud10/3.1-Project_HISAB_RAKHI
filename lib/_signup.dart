import 'package:flutter/cupertino.dart';
import 'package:hisab_khata/menu.dart';
import 'package:flutter/material.dart';
import 'package:hisab_khata/custom/_input.dart';
import 'package:hive/hive.dart';
import 'db.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  late Box userData = Hive.box('userData');
  late String userName ='';
  late String pin ='';
  late String phoneNumber ='';
  late String username ='';


  @override
  void initState() {
    super.initState();
    print(userData.values.toList());
    //initUser();

  }

  void initUser (){
    print("I AM RUNNING");
    //userData = Hive.box('userData');
    print(Hive.box('userData').values.toList());
  }

  void addUser(UserData user){
    print(user.toString());
     //userData =  await Hive.openBox('userData');
     userData.putAt(0,user);
    print('----------add user');
  }

void getUserData(index){
  print(userData.get(index)!.username);
  print(userData.get(index)!.pin);
  print(userData.get(index)!.number);
}

 void Data ;

  void getData(String inputData , String label){
     print('$label $inputData');
    if(label == 'Username'){
      username = inputData;
         print(username);
      }else if(label == 'Phone Number'){
         phoneNumber = inputData;
         print(phoneNumber);

    }else if(label == 'Pin'){
         pin = inputData;
         print(pin);

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Center(
          child: Text(
            'HISAB RAKHI',
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: 336,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


              CustomInput(hint : "Username",label: 'Username',getData:getData),
              CustomInput(hint : "Phone Number",label: 'Phone Number',getData:getData),
              CustomInput(hint : "Pin",label: 'Pin',password: true,getData:getData),
              CustomInput(hint : "Confirm Pin",label: 'Confirm Pin',password: true,getData:getData),

              Container(
                margin: EdgeInsets.only(top: 30),
                width: 150,
                height: 50,
                child: TextButton(

                    onPressed: (){
                        print('---------b email ${username} Pin ${pin} phone ${phoneNumber} ');
                        addUser(UserData(username: username,pin: pin,number: phoneNumber ));
                        Navigator.pushNamed(context, '/menu');

                      //----------------------
                        //addUser( new UserData("errorwhy","errorwhy","errorwhy"));//------------------------------------
                    },
                    child: Text("Confirm",
                    style: TextStyle(color: Colors.blueGrey),),
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2,color: Colors.grey) ,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    primary: Colors.white,
                    textStyle:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),


                ),
              ),

            ],
          ),
        ),
      ),
    );

  }
}
