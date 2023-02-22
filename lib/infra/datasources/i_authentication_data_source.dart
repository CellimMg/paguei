import '../../domain/entities/user.dart';

abstract class IAuthenticationDataSource {
  Future<User> signInWithGoogleAccount();
  Future<bool> signOut();
}