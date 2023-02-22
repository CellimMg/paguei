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
}