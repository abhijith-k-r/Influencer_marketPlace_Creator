import 'package:equatable/equatable.dart';

abstract class CreatorMyWorksEvent extends Equatable {
  const CreatorMyWorksEvent();

  @override
  List<Object?> get props => [];
}

class LoadCreatorWorksData extends CreatorMyWorksEvent {
  const LoadCreatorWorksData();
}

class FilterCreatorWorks extends CreatorMyWorksEvent {
  final String status;
  const FilterCreatorWorks(this.status);

  @override
  List<Object?> get props => [status];
}
