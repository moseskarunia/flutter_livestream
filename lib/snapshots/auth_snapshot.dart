import 'package:clock/clock.dart';
import 'package:cornerstone/cornerstone.dart';
import 'package:firebase_livestream/entities/app_user.dart';

class AuthSnapshot extends CornerstoneSnapshot {
  final AppUser? appUser;

  AuthSnapshot({this.appUser, DateTime? timestamp, Clock clock = const Clock()})
      : super(clock: clock, timestamp: timestamp ?? clock.now());

  @override
  List<Object?> get props => [appUser, timestamp];
}
