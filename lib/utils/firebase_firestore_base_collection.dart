import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFirestoreBaseCollection{
  final FirebaseAuth _firebaseAuth;

  FirebaseFirestoreBaseCollection(this._firebaseAuth);

  DocumentReference getUserDoc() {
    return FirebaseFirestore.instance.collection('users').doc(_firebaseAuth.currentUser!.uid);
  }
}