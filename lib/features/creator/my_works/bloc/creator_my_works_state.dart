import 'package:equatable/equatable.dart';
import '../data/models/creator_work_item.dart';
import '../data/models/creator_work_deliverable.dart';
import '../data/models/creator_work_milestone.dart';

enum CreatorMyWorksStatus { initial, loading, success, failure }

class CreatorMyWorksState extends Equatable {
  final CreatorMyWorksStatus status;
  final List<CreatorWorkItem> works;
  final List<CreatorWorkDeliverable> deliverables;
  final List<CreatorWorkMilestone> milestones;
  final String activeFilter;
  final String? errorMessage;

  const CreatorMyWorksState({
    this.status = CreatorMyWorksStatus.initial,
    this.works = const [],
    this.deliverables = const [],
    this.milestones = const [],
    this.activeFilter = 'All Works (8)',
    this.errorMessage,
  });

  List<CreatorWorkItem> get filteredWorks {
    if (activeFilter.startsWith('In Progress')) {
      return works.where((w) => w.status == 'In Progress').toList();
    } else if (activeFilter.startsWith('Accepted')) {
      return works.where((w) => w.status == 'Accepted').toList();
    } else if (activeFilter.startsWith('Applied')) {
      return works.where((w) => w.status == 'Applied').toList();
    } else if (activeFilter.startsWith('Completed')) {
      return works.where((w) => w.status == 'Paid').toList();
    }
    return works;
  }

  CreatorMyWorksState copyWith({
    CreatorMyWorksStatus? status,
    List<CreatorWorkItem>? works,
    List<CreatorWorkDeliverable>? deliverables,
    List<CreatorWorkMilestone>? milestones,
    String? activeFilter,
    String? errorMessage,
  }) {
    return CreatorMyWorksState(
      status: status ?? this.status,
      works: works ?? this.works,
      deliverables: deliverables ?? this.deliverables,
      milestones: milestones ?? this.milestones,
      activeFilter: activeFilter ?? this.activeFilter,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        works,
        deliverables,
        milestones,
        activeFilter,
        errorMessage,
      ];
}
