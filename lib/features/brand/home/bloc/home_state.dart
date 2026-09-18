import 'package:equatable/equatable.dart';
import '../data/models/creator_model.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<CreatorModel> creators;
  final String selectedFilter;
  final String searchQuery;
  final String? errorMessage;

  const HomeState({
    this.status = HomeStatus.initial,
    this.creators = const [],
    this.selectedFilter = 'All Creators',
    this.searchQuery = '',
    this.errorMessage,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<CreatorModel>? creators,
    String? selectedFilter,
    String? searchQuery,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      creators: creators ?? this.creators,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      searchQuery: searchQuery ?? this.searchQuery,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        creators,
        selectedFilter,
        searchQuery,
        errorMessage,
      ];
}
