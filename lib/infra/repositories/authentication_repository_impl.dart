import 'package:melembra/domain/entities/user.dart';
import 'package:melembra/domain/repositories/i_authentication_repository.dart';

import '../datasources/i_authentication_data_source.dart';

class AuthenticationRepositoryImpl implements IAuthenticationRepository{

  final IAuthenticationDataSource _authenticationDataSource;

  AuthenticationRepositoryImpl(this._authenticationDataSource);

  @override
  Future<User> signInWithGoogleAccount() async {
    return await _authenticationDataSource.signInWithGoogleAccount();
  }

  @override
  Future<bool> signOut() async {
    return await _authenticationDataSource.signOut();
  }

  @override
  bool alreadySignedIn() {
    return _authenticationDataSource.alreadySignedIn();
  }
}