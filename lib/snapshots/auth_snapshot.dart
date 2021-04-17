import 'package:clock/clock.dart';
import 'package:cornerstone/cornerstone.dart';
import 'package:firebase_livestream/entities/app_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_snapshot.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class AuthSnapshot extends CornerstoneSnapshot {
  final AppUser? appUser;

  AuthSnapshot({this.appUser, DateTime? timestamp, Clock clock = const Clock()})
      : super(clock: clock, timestamp: timestamp ?? clock.now());

  @override
  List<Object?> get props => [appUser, timestamp];

  factory AuthSnapshot.fromJson(Map json) => _$AuthSnapshotFromJson(json);
  Map<String, dynamic> toJson() => _$AuthSnapshotToJson(this);
}
