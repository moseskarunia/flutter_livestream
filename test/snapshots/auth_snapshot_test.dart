import 'package:clock/clock.dart';
import 'package:firebase_livestream/entities/app_user.dart';
import 'package:firebase_livestream/snapshots/auth_snapshot.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dateFixture = DateTime.parse('2020-10-10T00:00:00Z').toLocal();
  final fixedClock = Clock.fixed(dateFixture);

  final jsonFixture = <String, dynamic>{
    'appUser': <String, dynamic>{
      'displayName': 'John Doe',
      'email': 'johndoe@example.com'
    },
    'timestamp': '2020-10-10T00:00:00.000Z'
  };

  final fixture = AuthSnapshot(
    appUser: AppUser(
      displayName: 'John Doe',
      email: 'johndoe@example.com',
    ),
    timestamp: dateFixture,
    clock: fixedClock,
  );

  test('props', () {
    expect(fixture.props, [
      AppUser(displayName: 'John Doe', email: 'johndoe@example.com'),
      dateFixture,
    ]);
  });

  test('fromJson', () {
    expect(AuthSnapshot.fromJson(jsonFixture), fixture);
  });

  test('toJson', () {
    expect(fixture.toJson(), jsonFixture);
  });
}
