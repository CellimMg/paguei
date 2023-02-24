import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../domain/entities/user.dart' as domain;
import 'package:melembra/infra/datasources/i_authentication_data_source.dart';

class FirebaseAuthenticationDataSource implements IAuthenticationDataSource {

  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthenticationDataSource(
      this._firebaseAuth, this._googleSignIn);

  @override
  Future<domain.User> signInWithGoogleAccount() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final user = await _firebaseAuth.signInWithCredential(credential);
    return domain.User(
        id: user.user!.uid,
        name: user.user!.displayName!,
        email: user.user!.email!,
        pictureUrl: user.user!.photoURL!
    );
  }

  @override
  Future<bool> signOut() {
    return Future.value([_googleSignIn.signOut(), _firebaseAuth.signOut()]).then((value) => true);
  }

  @override
  bool alreadySignedIn() {
    return _firebaseAuth.currentUser != null;
  }

}