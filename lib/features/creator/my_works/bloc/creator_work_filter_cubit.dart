import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatorWorkFilterState extends Equatable {
  final String searchQuery;
  final Set<String> selectedStatuses;
  final String activeDatePreset;
  final Set<String> selectedFormats;

  const CreatorWorkFilterState({
    this.searchQuery = 'UrbanKicks',
    this.selectedStatuses = const {'Accepted', 'In Progress'},
    this.activeDatePreset = 'This Month',
    this.selectedFormats = const {'Instagram Reels', 'Stories (3x)'},
  });

  CreatorWorkFilterState copyWith({
    String? searchQuery,
    Set<String>? selectedStatuses,
    String? activeDatePreset,
    Set<String>? selectedFormats,
  }) {
    return CreatorWorkFilterState(
      searchQuery: searchQuery ?? this.searchQuery,
      selectedStatuses: selectedStatuses ?? this.selectedStatuses,
      activeDatePreset: activeDatePreset ?? this.activeDatePreset,
      selectedFormats: selectedFormats ?? this.selectedFormats,
    );
  }

  @override
  List<Object?> get props => [searchQuery, selectedStatuses, activeDatePreset, selectedFormats];
}

/// Cubit managing in-flight filter state for Creator Works (<55 LOC).
class CreatorWorkFilterCubit extends Cubit<CreatorWorkFilterState> {
  CreatorWorkFilterCubit() : super(const CreatorWorkFilterState());

  void updateSearch(String query) => emit(state.copyWith(searchQuery: query));

  void toggleStatus(String status) {
    final updated = Set<String>.of(state.selectedStatuses);
    updated.contains(status) ? updated.remove(status) : updated.add(status);
    emit(state.copyWith(selectedStatuses: updated));
  }

  void selectDatePreset(String preset) => emit(state.copyWith(activeDatePreset: preset));

  void toggleFormat(String format) {
    final updated = Set<String>.of(state.selectedFormats);
    updated.contains(format) ? updated.remove(format) : updated.add(format);
    emit(state.copyWith(selectedFormats: updated));
  }

  void resetAll() {
    emit(const CreatorWorkFilterState(
      searchQuery: '',
      selectedStatuses: {},
      activeDatePreset: 'All Time',
      selectedFormats: {},
    ));
  }
}
