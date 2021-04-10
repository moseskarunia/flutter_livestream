import 'package:cornerstone/cornerstone.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_livestream/data_sources/authentication/authentication_data_source.dart';
import 'package:firebase_livestream/entities/app_user.dart';
import 'package:hive/hive.dart';

abstract class AuthRepo
    with LocallyPersistentRepository, CornerstonePersistentRepositoryMixin {
  Future<Either<Failure, AppUser>> signInWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRepoImpl extends AuthRepo {
  final HiveInterface hive;
  final AuthenticationDataSource dataSource;

  AuthRepoImpl({required this.hive, required this.dataSource});

  @override
  Map<String, dynamic> get asJson => throw UnimplementedError();

  @override
  ConvertToFailure<Object> get convertToFailure => throw UnimplementedError();

  @override
  ConvertToSnapshot get convertToSnapshot => throw UnimplementedError();

  @override
  Future<Either<Failure, AppUser>> signInWithEmailPassword(
      {required String email, required String password}) {
    // TODO: implement signInWithEmailPassword
    throw UnimplementedError();
  }
}
