import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:melembra/domain/entities/user.dart' as domain;
import 'package:melembra/domain/repositories/i_authentication_repository.dart';

import '../domain/usecases/authentication.dart';
import '../external/datasources/firebase_authentication_data_source.dart';
import '../infra/datasources/i_authentication_data_source.dart';
import '../infra/repositories/authentication_repository_impl.dart';

final getIt = GetIt.instance;

void setupLocators() {
   getIt.registerLazySingleton<IAuthenticationDataSource>(() => FirebaseAuthenticationDataSource(FirebaseAuth.instance, GoogleSignIn()));
   getIt.registerLazySingleton<IAuthenticationRepository>(() => AuthenticationRepositoryImpl(getIt<IAuthenticationDataSource>()));
   getIt.registerLazySingleton<Authentication>(() => Authentication(getIt<IAuthenticationRepository>()));
}