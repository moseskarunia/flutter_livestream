import 'package:firebase_livestream/parameters/authentication/sign_in_param.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('props', () {
    expect(
      SignInParam(username: 'John Doe', password: 'adm123*').props,
      ['John Doe', 'adm123*'],
    );
  });
}
