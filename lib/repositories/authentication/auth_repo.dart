import 'package:clock/clock.dart';
import 'package:cornerstone/cornerstone.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_livestream/data_sources/authentication/authentication_data_source.dart';
import 'package:firebase_livestream/entities/app_user.dart';
import 'package:firebase_livestream/snapshots/auth_snapshot.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

abstract class AuthRepo
    with
        LocallyPersistentRepository<AuthSnapshot>,
        CornerstonePersistentRepositoryMixin<AuthSnapshot> {
  Future<Either<Failure, AuthSnapshot>> signInWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRepoImpl extends AuthRepo {
  final Clock clock;
  final HiveInterface hive;
  final AuthenticationDataSource dataSource;

  @override
  @visibleForTesting
  late AuthSnapshot snapshot;

  AuthRepoImpl({
    required this.hive,
    required this.dataSource,
    this.clock = const Clock(),
  }) : snapshot = AuthSnapshot(clock: clock);

  @override
  Map<String, dynamic> get asJson => snapshot.toJson();

  @override
  ConvertToFailure<Object> get convertToFailure => throw UnimplementedError();

  @override
  ConvertToSnapshot<AuthSnapshot> get convertToSnapshot =>
      throw UnimplementedError();

  @override
  Future<Either<Failure, AuthSnapshot>> signInWithEmailPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }
}
