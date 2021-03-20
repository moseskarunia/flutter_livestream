import 'dart:async';

import 'package:cornerstone/cornerstone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_livestream/parameters/authentication/sign_in_param.dart';

abstract class AuthenticationDataSource
    implements CreatorDataSource<User, SignInParam> {}

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  final FirebaseAuth _authInstance;

  AuthenticationDataSourceImpl({
    FirebaseAuth? authInstance,
  }) : _authInstance = authInstance ?? FirebaseAuth.instance;

  @override
  FutureOr<User> create({required SignInParam param}) async {
    throw UnimplementedError();
  }
}
