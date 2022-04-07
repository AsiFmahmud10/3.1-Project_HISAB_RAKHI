import 'package:hisab_khata/db.dart';
import 'package:hisab_khata/db/hivedb.dart';

abstract class IcustomerRepository{
   List<Customer> getAll();
   Customer getOne(String id);
}

class CustomerRepository implements IcustomerRepository{

  CustomerDb _db;
  CustomerRepository(this._db);

  @override
  List<Customer> getAll() {
    return _db.getAll();
    throw UnimplementedError();
  }

  @override
  Customer getOne(String id) {
       return _db.findOne(id);
    throw UnimplementedError();
  }

}

