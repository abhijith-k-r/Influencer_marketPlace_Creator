import 'package:equatable/equatable.dart';
import '../../data/models/creator_onboarding_model.dart';

enum OnboardingSubmissionStatus { idle, submitting, success, failure }

class OnboardingState extends Equatable {
  final CreatorOnboardingModel model;
  final OnboardingSubmissionStatus status;
  final String? errorMessage;

  const OnboardingState({
    this.model = const CreatorOnboardingModel(),
    this.status = OnboardingSubmissionStatus.idle,
    this.errorMessage,
  });

  OnboardingState copyWith({
    CreatorOnboardingModel? model,
    OnboardingSubmissionStatus? status,
    String? errorMessage,
  }) {
    return OnboardingState(
      model: model ?? this.model,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [model, status, errorMessage];
}
