import 'package:clock/clock.dart';
import 'package:firebase_livestream/data_sources/authentication/authentication_data_source.dart';
import 'package:firebase_livestream/entities/app_user.dart';
import 'package:firebase_livestream/repositories/authentication/auth_repo.dart';
import 'package:firebase_livestream/snapshots/auth_snapshot.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

class MockHive extends Mock implements HiveInterface {}

class MockDataSource extends Mock implements AuthenticationDataSource {}

void main() {
  final dateFixture = DateTime.parse('2020-10-10T00:00:00.000Z').toLocal();
  final fixedClock = Clock.fixed(dateFixture);

  final snapJsonFixture = <String, dynamic>{
    'appUser': <String, dynamic>{
      'displayName': 'John Doe',
      'email': 'johndoe@example.com'
    },
    'timestamp': '2020-10-10T00:00:00.000Z'
  };

  final snapFixture = AuthSnapshot(
    appUser: AppUser(
      displayName: 'John Doe',
      email: 'johndoe@example.com',
    ),
    timestamp: dateFixture,
    clock: fixedClock,
  );

  late MockHive mockHive;
  late MockDataSource mockDataSource;
  late AuthRepo repo;

  setUp(() {
    mockHive = MockHive();
    mockDataSource = MockDataSource();
    repo = AuthRepoImpl(
      hive: mockHive,
      dataSource: mockDataSource,
      clock: fixedClock,
    );
  });

  test('asJson', () {
    repo.snapshot = snapFixture;
    expect(repo.asJson, snapJsonFixture);
  });
}
