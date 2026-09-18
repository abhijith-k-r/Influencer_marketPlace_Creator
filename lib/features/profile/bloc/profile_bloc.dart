import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';
import '../data/repositories/profile_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository})
      : super(const ProfileState()) {
    on<LoadProfileEvent>((event, emit) async {
      emit(state.copyWith(status: ProfileStatus.loading));
      try {
        final profile = await profileRepository.getBrandProfile();
        emit(state.copyWith(
          status: ProfileStatus.success,
          profile: profile,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: ProfileStatus.failure,
          errorMessage: e.toString(),
        ));
      }
    });

    on<ToggleAutoDisbursementEvent>((event, emit) async {
      try {
        final updated =
            await profileRepository.toggleAutoDisbursement(event.enabled);
        emit(state.copyWith(profile: updated));
      } catch (e) {
        emit(state.copyWith(errorMessage: e.toString()));
      }
    });

    on<LogOutRequestedEvent>((event, emit) async {
      emit(state.copyWith(logoutStatus: LogoutStatus.loggingOut));
      await Future.delayed(const Duration(milliseconds: 900));
      emit(state.copyWith(logoutStatus: LogoutStatus.loggedOut));
    });
  }
}
