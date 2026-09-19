import 'package:equatable/equatable.dart';

abstract class CreatorMessagesEvent extends Equatable {
  const CreatorMessagesEvent();

  @override
  List<Object?> get props => [];
}

class LoadCreatorMessages extends CreatorMessagesEvent {
  const LoadCreatorMessages();
}

class FilterCreatorMessages extends CreatorMessagesEvent {
  final String filter;
  const FilterCreatorMessages(this.filter);

  @override
  List<Object?> get props => [filter];
}
