import 'dart:convert';

import 'package:hive/hive.dart';
part 'db.g.dart';
//flutter pub run build_runner build --delete-conflicting-outputs
@HiveType(typeId: 1)
class UserData {
  @HiveField(0)
   late String username;
  @HiveField(1)
   late String pin;
  @HiveField(2)
   late String number;
  @HiveField(3)
  double? oveallSell;
  @HiveField(4)
  double? oveallDue;

  UserData(
      {required this.username,
        required this.pin,
        required this.number,
      this.oveallDue = 0.0,
      this.oveallSell = 0.0
      });


}

@HiveType(typeId: 2)
class Customer extends HiveObject{
  @HiveField(0)
  String customerName;
  @HiveField(1)
  String customerEmail;
  @HiveField(2)
  String customerPhone;
  @HiveField(3)
  int dueBalance = 0;


  Customer({this.dueBalance=0,
    required this.customerName,required this.customerPhone,this.customerEmail='Email is not given'});
}

@HiveType(typeId:3)
class Report{
  @HiveField(0)
  int customerGiven;
  @HiveField(1)
  int customerDue;

  @HiveField(3)
  var reportDate;
  @HiveField(4)
  String details;
  @HiveField(5)
  String customerName;
  @HiveField(6)
  String customerId;


  String toString(){
    return jsonEncode({
      'deposit' : customerGiven,
      'due' : customerDue,
      'date': reportDate,
      'details': details,
      'customerName':customerName,
      'customerId' : customerId
    });
  }

  Report({this.customerDue=0,this.customerGiven=0,required this.reportDate,required this.details,
  required this.customerId,required this.customerName});
}