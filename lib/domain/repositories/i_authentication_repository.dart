import '../entities/user.dart';

abstract class IAuthenticationRepository {
  Future<User> signInWithGoogleAccount();
  Future<bool> signOut();
  bool alreadySignedIn();
  User getCurrentUser();
  Stream<User> get user;
}