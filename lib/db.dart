import 'package:hive/hive.dart';
part 'db.g.dart';

@HiveType(typeId: 1)
class UserData{
  @HiveField(0)
  late String username;
  @HiveField(1)
  late String pin;
  @HiveField(2)
  late String number;

  UserData( this.username, this.pin, this.number);

}

