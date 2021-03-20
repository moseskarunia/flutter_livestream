import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAuthInstance extends Mock implements FirebaseAuth {}

void main() {
  late FirebaseAuth authInstance;

  setUp(() {
    authInstance = MockAuthInstance();
  });
}
