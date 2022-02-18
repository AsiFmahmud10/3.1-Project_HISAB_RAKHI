import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class User{
    @HiveField(0)
    late String username;
    @HiveField(1)
    late String pin;
    @HiveField(2)
    late String number;

    User( this.username, this.pin, this.number);
 /*
    String getUsername() {
       return this.username;
    }

    String getPin() {
        return this.pin;
    }

    String getPhonenumber() {
        return this.number;
    }

    String toString(){
        return " Name : ${this.username} pin : ${this.pin} number : ${this.number}";
    }

*/
}

