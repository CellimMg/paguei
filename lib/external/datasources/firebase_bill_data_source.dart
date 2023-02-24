import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:melembra/domain/entities/bill.dart';
import 'package:melembra/utils/firebase_firestore_base_collection.dart';

import '../../infra/datasources/i_bill_data_source.dart';

class FirebaseBillDataSource implements IBillDataSource {

  late final CollectionReference collection;

  FirebaseBillDataSource._(this.collection);

  factory FirebaseBillDataSource(FirebaseFirestoreBaseCollection firebaseFirestoreBaseCollection) {
    return FirebaseBillDataSource._(firebaseFirestoreBaseCollection.getUserDoc().collection('bills'));
  }

  @override
  Future<bool> createBill(Bill bill) async {
    try {
      await collection.add(bill.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteBill(String id) async {
    try{
      await collection.doc(id).update({
        'deleted': true
      });
      return true;
    }catch(e){
      return false;
    }
  }

  @override
  Future<Bill> getBillById(String id) async {
    try{
      return await collection.doc(id).get().then((value) => Bill.fromJson(value.data() as Map<String, dynamic>));
    }catch(e){
      return Future.error(e);
    }
  }

  @override
  Future<List<Bill>> getBills() async {
    try{
      return await collection.where('deleted', isEqualTo: false).get().then((value) => value.docs.map((e) => Bill.fromJson(e.data() as Map<String, dynamic>)).toList());
    }catch(e){
      return Future.error(e);
    }
  }

  @override
  Future<bool> updateBill(Bill bill) async {
    try{
      await collection.doc(bill.id).update(bill.toJson());
      return true;
    }catch(e){
      return false;
    }
  }

}