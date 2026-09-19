import 'package:equatable/equatable.dart';
import '../data/models/creator_opportunity_model.dart';

enum CreatorHomeStatus { initial, loading, success, failure }

class CreatorHomeState extends Equatable {
  final CreatorHomeStatus status;
  final List<CreatorOpportunityModel> opportunities;
  final String activeFilter;
  final String? errorMessage;

  const CreatorHomeState({
    this.status = CreatorHomeStatus.initial,
    this.opportunities = const [],
    this.activeFilter = 'all',
    this.errorMessage,
  });

  List<CreatorOpportunityModel> get filteredOpportunities {
    if (activeFilter == 'all') return opportunities;
    return opportunities.where((o) => o.category.toLowerCase() == activeFilter.toLowerCase()).toList();
  }

  CreatorHomeState copyWith({
    CreatorHomeStatus? status,
    List<CreatorOpportunityModel>? opportunities,
    String? activeFilter,
    String? errorMessage,
  }) {
    return CreatorHomeState(
      status: status ?? this.status,
      opportunities: opportunities ?? this.opportunities,
      activeFilter: activeFilter ?? this.activeFilter,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, opportunities, activeFilter, errorMessage];
}
