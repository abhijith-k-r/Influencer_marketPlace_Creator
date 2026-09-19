import 'package:flutter/foundation.dart';
import '../data/models/creator_profile_data.dart';

@immutable
sealed class ProfileState {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

final class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

final class ProfileLoaded extends ProfileState {
  final CreatorProfileData profile;
  final List<FeaturedWorkItem> featuredWorks;

  const ProfileLoaded({
    required this.profile,
    required this.featuredWorks,
  });
}

final class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);
}
