import '../entities/bill.dart';

abstract class IBillRepository{
  Future<bool> createBill(Bill bill);
  Future<bool> updateBill(Bill bill);
  Future<bool> deleteBill(String id);
  Future<List<Bill>> getBills();
  Future<Bill> getBillById(String id);
}