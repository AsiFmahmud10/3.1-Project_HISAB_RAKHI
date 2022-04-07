import 'package:hisab_khata/db.dart';
import 'package:hisab_khata/db/hivedb.dart';
import 'package:hisab_khata/repository/customerInterface.dart';

class CustomerContoller{

  CustomerRepository customerRepo = CustomerRepository(CustomerDb());
  late Customer customer;
  initCustomer(String id){
    this.customer = customerRepo.getOne(id);
  }

  String getName(){
          return customer.customerName;
  }
  String StringgetEmail(){
     return customer.customerEmail;
  }
  String getPhone(){
     return customer.customerPhone;
  }
  int getDue(){
    return customer.dueBalance;
  }

}