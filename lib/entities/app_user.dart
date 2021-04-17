import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class AppUser extends Equatable {
  final String displayName, email;

  const AppUser({
    required this.displayName,
    required this.email,
  });

  @override
  List<Object?> get props => [displayName, email];

  factory AppUser.fromJson(Map json) => _$AppUserFromJson(json);
  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
