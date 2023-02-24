import 'package:melembra/domain/entities/bill.dart';
import 'package:melembra/domain/repositories/i_bill_repository.dart';

class BillRepositoryImpl implements IBillRepository{



  @override
  Future<bool> createBill(Bill bill) {
    // TODO: implement createBill
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteBill(String id) {
    // TODO: implement deleteBill
    throw UnimplementedError();
  }

  @override
  Future<Bill> getBillById(String id) {
    // TODO: implement getBillById
    throw UnimplementedError();
  }

  @override
  Future<List<Bill>> getBills() {
    // TODO: implement getBills
    throw UnimplementedError();
  }

  @override
  Future<bool> updateBill(Bill bill) {
    // TODO: implement updateBill
    throw UnimplementedError();
  }

}