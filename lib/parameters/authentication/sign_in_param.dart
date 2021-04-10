import 'package:equatable/equatable.dart';

class SignInParam extends Equatable {
  final String username, password;

  const SignInParam({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
