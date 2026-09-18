import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object?> get props => [];
}

class LoadProfileEvent extends ProfileEvent {
  const LoadProfileEvent();
}

class ToggleAutoDisbursementEvent extends ProfileEvent {
  final bool enabled;
  const ToggleAutoDisbursementEvent(this.enabled);

  @override
  List<Object?> get props => [enabled];
}

class LogOutRequestedEvent extends ProfileEvent {
  const LogOutRequestedEvent();
}
