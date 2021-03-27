import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String displayName, email;

  const AppUser({
    required this.displayName,
    required this.email,
  });

  @override
  List<Object?> get props => [displayName, email];
}
