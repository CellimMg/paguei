import '../entities/bill.dart';
import '../repositories/i_bill_repository.dart';

class BillUseCase{
  final IBillRepository _billRepository;
  BillUseCase(this._billRepository);

  Future<List<Bill>> getBills() async {
    return await _billRepository.getBills();
  }

  Future<Bill> getBill(String id) async {
    return await _billRepository.getBillById(id);
  }

  Future<void> addBill(Bill bill) async {
    await _billRepository.createBill(bill);
  }

  Future<void> updateBill(Bill bill) async {
    await _billRepository.updateBill(bill);
  }

  Future<void> deleteBill(String id) async {
    await _billRepository.deleteBill(id);
  }
}