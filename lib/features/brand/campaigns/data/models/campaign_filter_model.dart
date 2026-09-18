import 'package:equatable/equatable.dart';
import 'campaign_model.dart';

class CampaignFilterModel extends Equatable {
  final String datePreset;
  final String fromDate;
  final String toDate;
  final Set<CampaignStatus> selectedStatuses;
  final CampaignAccessType? selectedAccessType;
  final double minBudget;
  final double maxBudget;
  final Set<String> selectedPlatforms;
  final Set<String> selectedNiches;
  final String searchQuery;

  const CampaignFilterModel({
    this.datePreset = 'This Month',
    this.fromDate = '01 Oct 2024',
    this.toDate = '31 Dec 2024',
    this.selectedStatuses = const {},
    this.selectedAccessType,
    this.minBudget = 0,
    this.maxBudget = 300000,
    this.selectedPlatforms = const {'Instagram', 'YouTube'},
    this.selectedNiches = const {'Fashion & Streetwear'},
    this.searchQuery = '',
  });

  static const CampaignFilterModel initial = CampaignFilterModel();

  CampaignFilterModel copyWith({
    String? datePreset,
    String? fromDate,
    String? toDate,
    Set<CampaignStatus>? selectedStatuses,
    CampaignAccessType? selectedAccessType,
    double? minBudget,
    double? maxBudget,
    Set<String>? selectedPlatforms,
    Set<String>? selectedNiches,
    String? searchQuery,
    bool clearAccessType = false,
  }) {
    return CampaignFilterModel(
      datePreset: datePreset ?? this.datePreset,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      selectedStatuses: selectedStatuses ?? this.selectedStatuses,
      selectedAccessType: clearAccessType
          ? null
          : (selectedAccessType ?? this.selectedAccessType),
      minBudget: minBudget ?? this.minBudget,
      maxBudget: maxBudget ?? this.maxBudget,
      selectedPlatforms: selectedPlatforms ?? this.selectedPlatforms,
      selectedNiches: selectedNiches ?? this.selectedNiches,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [
        datePreset,
        fromDate,
        toDate,
        selectedStatuses,
        selectedAccessType,
        minBudget,
        maxBudget,
        selectedPlatforms,
        selectedNiches,
        searchQuery,
      ];
}
