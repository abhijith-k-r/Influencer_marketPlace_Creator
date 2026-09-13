import 'package:equatable/equatable.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

final class Step1BasicsUpdated extends OnboardingEvent {
  final String brandName;
  final String bio;
  final String location;
  final String language;

  const Step1BasicsUpdated({
    required this.brandName,
    required this.bio,
    required this.location,
    required this.language,
  });

  @override
  List<Object?> get props => [brandName, bio, location, language];
}

final class NicheToggled extends OnboardingEvent {
  final String niche;
  const NicheToggled(this.niche);

  @override
  List<Object?> get props => [niche];
}

final class ContentFormatToggled extends OnboardingEvent {
  final String format;
  const ContentFormatToggled(this.format);

  @override
  List<Object?> get props => [format];
}

final class BaseRateChanged extends OnboardingEvent {
  final String rate;
  const BaseRateChanged(this.rate);

  @override
  List<Object?> get props => [rate];
}

final class SocialHandleUpdated extends OnboardingEvent {
  final String platform;
  final String handle;
  final String count;

  const SocialHandleUpdated({
    required this.platform,
    required this.handle,
    required this.count,
  });

  @override
  List<Object?> get props => [platform, handle, count];
}

final class BrandCollabAdded extends OnboardingEvent {
  final String brand;
  const BrandCollabAdded(this.brand);

  @override
  List<Object?> get props => [brand];
}

final class SubmitOnboardingProfile extends OnboardingEvent {
  const SubmitOnboardingProfile();
}
