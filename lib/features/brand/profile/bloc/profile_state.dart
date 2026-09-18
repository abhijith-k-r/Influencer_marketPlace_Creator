import 'package:equatable/equatable.dart';
import '../data/models/brand_profile_model.dart';

enum ProfileStatus { initial, loading, success, failure }

enum LogoutStatus { idle, loggingOut, loggedOut }

class ProfileState extends Equatable {
  final ProfileStatus status;
  final BrandProfileModel? profile;
  final LogoutStatus logoutStatus;
  final String? errorMessage;

  const ProfileState({
    this.status = ProfileStatus.initial,
    this.profile,
    this.logoutStatus = LogoutStatus.idle,
    this.errorMessage,
  });

  ProfileState copyWith({
    ProfileStatus? status,
    BrandProfileModel? profile,
    LogoutStatus? logoutStatus,
    String? errorMessage,
  }) {
    return ProfileState(
      status: status ?? this.status,
      profile: profile ?? this.profile,
      logoutStatus: logoutStatus ?? this.logoutStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, profile, logoutStatus, errorMessage];
}
