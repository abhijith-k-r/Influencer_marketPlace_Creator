import 'package:equatable/equatable.dart';

abstract class CreatorPaymentsEvent extends Equatable {
  const CreatorPaymentsEvent();

  @override
  List<Object?> get props => [];
}

class LoadCreatorPaymentsData extends CreatorPaymentsEvent {
  const LoadCreatorPaymentsData();
}

class FilterCreatorPaymentsByStatus extends CreatorPaymentsEvent {
  final String filter;
  const FilterCreatorPaymentsByStatus(this.filter);

  @override
  List<Object?> get props => [filter];
}
