import 'package:melembra/domain/repositories/i_authentication_repository.dart';

import '../entities/user.dart';

class Authentication {
  final IAuthenticationRepository _repository;

  Authentication(this._repository);

  Future<User> signInWithGoogleAccount() async {
    return await _repository.signInWithGoogleAccount();
  }

  Future<bool> signOut() async {
    return await _repository.signOut();
  }

  User getCurrentUser() {
    return _repository.getCurrentUser();
  }

  bool alreadySignedIn() {
    return _repository.alreadySignedIn();
  }

  Stream<User> get user => _repository.user;
}