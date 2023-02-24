import 'package:melembra/domain/entities/bill.dart';
import 'package:melembra/domain/repositories/i_bill_repository.dart';

import '../datasources/i_bill_data_source.dart';

class BillRepositoryImpl implements IBillRepository{

  final IBillDataSource _dataSource;

  BillRepositoryImpl(this._dataSource);

  @override
  Future<bool> createBill(Bill bill) async {
    return await _dataSource.createBill(bill);
  }

  @override
  Future<bool> deleteBill(String id) async {
    return await _dataSource.deleteBill(id);
  }

  @override
  Future<Bill> getBillById(String id) async {
    return await _dataSource.getBillById(id);
  }

  @override
  Future<List<Bill>> getBills() async {
    return await _dataSource.getBills();
  }

  @override
  Future<bool> updateBill(Bill bill) async {
    return await _dataSource.updateBill(bill);
  }

}