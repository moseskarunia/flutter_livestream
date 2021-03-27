import 'dart:async';

import 'package:cornerstone/cornerstone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_livestream/entities/app_user.dart';
import 'package:firebase_livestream/parameters/authentication/sign_in_param.dart';

abstract class AuthenticationDataSource
    implements CreatorDataSource<AppUser, SignInParam> {}

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  final FirebaseAuth _authInstance;

  AuthenticationDataSourceImpl({
    FirebaseAuth? authInstance,
  }) : _authInstance = authInstance ?? FirebaseAuth.instance;

  @override
  FutureOr<AppUser> create({required SignInParam param}) async {
    final result = await _authInstance.signInWithEmailAndPassword(
      email: param.username,
      password: param.password,
    );

    return AppUser(
      displayName: result.user?.displayName ?? '',
      email: result.user!.email!,
    );
  }
}
