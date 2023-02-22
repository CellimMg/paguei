import 'package:flutter_test/flutter_test.dart';
import 'package:melembra/domain/entities/user.dart';
import 'package:melembra/domain/repositories/i_authentication_repository.dart';
import 'package:melembra/domain/usecases/authentication.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<IAuthenticationRepository>()])
import 'authentication.mocks.dart';

void main() {
  late IAuthenticationRepository repository;
  late Authentication authentication;

  setUp(() => {
        repository = MockIAuthenticationRepository(),
        authentication = Authentication(repository)
      });

  test('should return a User when signInWithGoogleAccount is called', () async {
    when(repository.signInWithGoogleAccount()).thenAnswer((_) async =>
        User(id: '1', name: 'User', email: 'email', pictureUrl: 'url'));
    final result = await authentication.signInWithGoogleAccount();

    expect(result, isA<User>());
  });

  test('should throw a Exception when signInWithGoogleAccount is called', () => {
    when(repository.signInWithGoogleAccount()).thenThrow(Exception()),
    expect(authentication.signInWithGoogleAccount(), throwsException)
  });

  test('should return a bool when signOut is called', () async {
    when(repository.signOut()).thenAnswer((_) async => true);

    final result = await authentication.signOut();

    expect(result, isA<bool>());
  });

  test('should throw a exception when signout is called', () => {
    when(repository.signOut()).thenThrow(Exception()),
    expect(authentication.signOut(), throwsException)
  });
}
