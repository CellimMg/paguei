import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:melembra/domain/repositories/i_authentication_repository.dart';
import 'package:melembra/domain/repositories/i_bill_repository.dart';
import 'package:melembra/domain/usecases/bill_usecase.dart';
import 'package:melembra/external/datasources/firebase_bill_data_source.dart';
import 'package:melembra/infra/datasources/i_bill_data_source.dart';
import 'package:melembra/infra/repositories/bill_repository.impl.dart';
import 'package:melembra/utils/firebase_firestore_base_collection.dart';

import '../domain/usecases/authentication.dart';
import '../external/datasources/firebase_authentication_data_source.dart';
import '../infra/datasources/i_authentication_data_source.dart';
import '../infra/repositories/authentication_repository_impl.dart';

final getIt = GetIt.instance;

void setupLocators() {
   getIt.registerLazySingleton<IAuthenticationDataSource>(() => FirebaseAuthenticationDataSource(FirebaseAuth.instance, GoogleSignIn()));
   getIt.registerLazySingleton<IAuthenticationRepository>(() => AuthenticationRepositoryImpl(getIt<IAuthenticationDataSource>()));
   getIt.registerLazySingleton<Authentication>(() => Authentication(getIt<IAuthenticationRepository>()));

   getIt.registerLazySingleton<FirebaseFirestoreBaseCollection>(() => FirebaseFirestoreBaseCollection(FirebaseAuth.instance));
   getIt.registerLazySingleton<IBillDataSource>(() => FirebaseBillDataSource(getIt<FirebaseFirestoreBaseCollection>()));
   getIt.registerLazySingleton<IBillRepository>(() => BillRepositoryImpl(getIt<IBillDataSource>()));
   getIt.registerLazySingleton<BillUseCase>(() => BillUseCase(getIt<IBillRepository>()));
}