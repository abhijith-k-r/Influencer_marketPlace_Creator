import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class LoadCreatorsEvent extends HomeEvent {
  const LoadCreatorsEvent();
}

class SelectFilterEvent extends HomeEvent {
  final String filter;
  const SelectFilterEvent(this.filter);

  @override
  List<Object?> get props => [filter];
}

class SearchQueryChangedEvent extends HomeEvent {
  final String query;
  const SearchQueryChangedEvent(this.query);

  @override
  List<Object?> get props => [query];
}
