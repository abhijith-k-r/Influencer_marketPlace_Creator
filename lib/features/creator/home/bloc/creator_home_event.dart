import 'package:equatable/equatable.dart';

abstract class CreatorHomeEvent extends Equatable {
  const CreatorHomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadCreatorHomeOpportunities extends CreatorHomeEvent {
  const LoadCreatorHomeOpportunities();
}

class FilterCreatorHomeOpportunities extends CreatorHomeEvent {
  final String filter;

  const FilterCreatorHomeOpportunities(this.filter);

  @override
  List<Object?> get props => [filter];
}
