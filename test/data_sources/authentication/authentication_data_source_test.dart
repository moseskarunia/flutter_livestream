import 'package:cornerstone/cornerstone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_livestream/data_sources/authentication/authentication_data_source.dart';
import 'package:firebase_livestream/entities/app_user.dart';
import 'package:firebase_livestream/parameters/authentication/sign_in_param.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAuthInstance extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

void main() {
  final signInParamFixture = SignInParam(
    username: 'johndoe@test.com',
    password: 'admin123*',
  );

  late UserCredential userCredential;
  late User user;
  late FirebaseAuth authInstance;
  late AuthenticationDataSourceImpl dataSource;

  setUp(() {
    userCredential = MockUserCredential();
    user = MockUser();
    authInstance = MockAuthInstance();
    dataSource = AuthenticationDataSourceImpl(authInstance: authInstance);

    when(() => userCredential.user).thenReturn(user);
  });

  group('create', () {
    tearDown(() {
      verify(
        () => authInstance.signInWithEmailAndPassword(
          email: 'johndoe@test.com',
          password: 'admin123*',
        ),
      ).called(1);
    });
    group('should convert FirebaseAuthException to CornerstoneException', () {
      test('with name err.app.WRONG_PASSWORD', () async {
        when(
          () => authInstance.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(FirebaseAuthException(code: 'wrong-password'));

        await expectLater(
          () => dataSource.create(param: signInParamFixture),
          throwsA(CornerstoneException(name: 'err.app.WRONG_PASSWORD')),
        );
      });

      test('with name err.app.USER_NOT_FOUND', () async {
        when(
          () => authInstance.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(FirebaseAuthException(code: 'user-not-found'));

        await expectLater(
          () => dataSource.create(param: signInParamFixture),
          throwsA(CornerstoneException(name: 'err.app.USER_NOT_FOUND')),
        );
      });
    });
    test(
      'must call firebaseAuth signInWithPassword and returns AppUser',
      () async {
        when(() => user.email).thenReturn('johndoe@test.com');
        when(() => user.displayName).thenReturn('John Doe');
        when(
          () => authInstance.signInWithEmailAndPassword(
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenAnswer((_) async => userCredential);

        final result = await dataSource.create(param: signInParamFixture);

        expect(
          result,
          AppUser(displayName: 'John Doe', email: 'johndoe@test.com'),
        );
      },
    );
  });
}
