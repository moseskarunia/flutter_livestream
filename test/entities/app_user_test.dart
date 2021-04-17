import 'package:firebase_livestream/entities/app_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final jsonFixture = <String, dynamic>{
    'displayName': 'John Doe',
    'email': 'johndoe@example.com'
  };

  final fixture = AppUser(
    displayName: 'John Doe',
    email: 'johndoe@example.com',
  );

  test('props', () {
    expect(
      fixture.props,
      ['John Doe', 'johndoe@example.com'],
    );
  });

  test('fromJson', () {
    expect(AppUser.fromJson(jsonFixture), fixture);
  });

  test('toJson', () {
    expect(fixture.toJson(), jsonFixture);
  });
}
