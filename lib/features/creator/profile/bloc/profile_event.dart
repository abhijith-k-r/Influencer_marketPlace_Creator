import 'package:flutter/foundation.dart';

@immutable
sealed class ProfileEvent {
  const ProfileEvent();
}

final class LoadProfileEvent extends ProfileEvent {
  const LoadProfileEvent();
}

final class RefreshProfileEvent extends ProfileEvent {
  const RefreshProfileEvent();
}
