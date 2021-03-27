import 'package:firebase_livestream/entities/app_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('props', () {
    expect(
      AppUser(
        displayName: 'John Doe',
        email: 'johndoe@example.com',
      ).props,
      ['John Doe', 'johndoe@example.com'],
    );
  });
}
