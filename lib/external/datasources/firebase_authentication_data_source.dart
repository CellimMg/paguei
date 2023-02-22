import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user.dart' as domain;
import 'package:melembra/infra/datasources/i_authentication_data_source.dart';

class FirebaseAuthenticationDataSource implements IAuthenticationDataSource {

  final FirebaseAuth _firebaseAuth;
  final GoogleAuthProvider _googleAuthProvider;

  FirebaseAuthenticationDataSource(
      this._firebaseAuth, this._googleAuthProvider);

  @override
  Future<domain.User> signInWithGoogleAccount() async {
    final userCredential = await _firebaseAuth.signInWithPopup(_googleAuthProvider);
    final user = await _firebaseAuth.signInWithCredential(userCredential.credential!);
    return domain.User(
        id: user.user!.uid,
        name: user.user!.displayName!,
        email: user.user!.email!,
        pictureUrl: user.user!.photoURL!
    );
  }

  @override
  Future<bool> signOut() {
    return _firebaseAuth.signOut().then((value) => true);
  }

}