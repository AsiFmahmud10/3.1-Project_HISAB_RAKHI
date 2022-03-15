import 'dart:convert';

import 'package:hive/hive.dart';
part 'db.g.dart';

@HiveType(typeId: 1)
class UserData {
  @HiveField(0)
  late String username;
  @HiveField(1)
  late String pin;
  @HiveField(2)
  late String number;

  UserData( this.username, this.pin, this.number);

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

  String toString(){
    return jsonEncode({
      'deposit' : customerGiven,
      'due' : customerDue,
      'date': reportDate,
      'details': details
    });
  }

  Report({this.customerDue=0,this.customerGiven=0,required this.reportDate,required this.details});
}