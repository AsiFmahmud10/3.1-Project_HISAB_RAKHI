
import 'package:hive/hive.dart';

import '../db.dart';

class CustomerDb{
  Box customerData = Hive.box('customerData');

  List<Customer> getAll(){
     return List<Customer>.from(customerData.values.toList());
  }
  Customer findOne(String id){
    return getAll().where((element) => element.key==id) as Customer;
  }

}