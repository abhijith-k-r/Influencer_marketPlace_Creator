import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState()) {
    on<Step1BasicsUpdated>(_onStep1Updated);
    on<NicheToggled>(_onNicheToggled);
    on<ContentFormatToggled>(_onFormatToggled);
    on<BaseRateChanged>(_onRateChanged);
    on<SocialHandleUpdated>(_onSocialUpdated);
    on<BrandCollabAdded>(_onBrandAdded);
    on<SubmitOnboardingProfile>(_onSubmit);
  }

  void _onStep1Updated(
    Step1BasicsUpdated event,
    Emitter<OnboardingState> emit,
  ) {
    emit(
      state.copyWith(
        model: state.model.copyWith(
          brandName: event.brandName,
          bio: event.bio,
          location: event.location,
          language: event.language,
        ),
      ),
    );
  }

  void _onNicheToggled(NicheToggled event, Emitter<OnboardingState> emit) {
    final list = List<String>.from(state.model.niches);
    list.contains(event.niche)
        ? list.remove(event.niche)
        : list.add(event.niche);
    emit(state.copyWith(model: state.model.copyWith(niches: list)));
  }

  void _onFormatToggled(
    ContentFormatToggled event,
    Emitter<OnboardingState> emit,
  ) {
    final list = List<String>.from(state.model.contentFormats);
    list.contains(event.format)
        ? list.remove(event.format)
        : list.add(event.format);
    emit(state.copyWith(model: state.model.copyWith(contentFormats: list)));
  }

  void _onRateChanged(BaseRateChanged event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(model: state.model.copyWith(baseRate: event.rate)));
  }

  void _onSocialUpdated(
    SocialHandleUpdated event,
    Emitter<OnboardingState> emit,
  ) {
    final handles = Map<String, String>.from(state.model.socialHandles);
    final counts = Map<String, String>.from(state.model.followerCounts);
    handles[event.platform] = event.handle;
    counts[event.platform] = event.count;
    emit(
      state.copyWith(
        model: state.model.copyWith(
          socialHandles: handles,
          followerCounts: counts,
        ),
      ),
    );
  }

  void _onBrandAdded(BrandCollabAdded event, Emitter<OnboardingState> emit) {
    final brands = List<String>.from(state.model.pastBrands)..add(event.brand);
    emit(state.copyWith(model: state.model.copyWith(pastBrands: brands)));
  }

  Future<void> _onSubmit(
    SubmitOnboardingProfile event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(status: OnboardingSubmissionStatus.submitting));
    await Future.delayed(const Duration(milliseconds: 1000));
    emit(state.copyWith(status: OnboardingSubmissionStatus.success));
  }
}
