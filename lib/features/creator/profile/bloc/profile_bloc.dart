import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repositories/creator_profile_repository.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class CreatorProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final CreatorProfileRepository repository;

  CreatorProfileBloc({required this.repository}) : super(const ProfileInitial()) {
    on<LoadProfileEvent>(_onLoadProfile);
    on<RefreshProfileEvent>(_onRefreshProfile);
  }

  Future<void> _onLoadProfile(
    LoadProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());
    try {
      final profile = await repository.getProfile();
      final featuredWorks = await repository.getFeaturedWorks();
      emit(ProfileLoaded(profile: profile, featuredWorks: featuredWorks));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> _onRefreshProfile(
    RefreshProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final profile = await repository.getProfile();
      final featuredWorks = await repository.getFeaturedWorks();
      emit(ProfileLoaded(profile: profile, featuredWorks: featuredWorks));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}

typedef ProfileBloc = CreatorProfileBloc;
