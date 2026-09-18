import 'package:equatable/equatable.dart';
import '../data/models/user_role.dart';

abstract class RoleEvent extends Equatable {
  const RoleEvent();

  @override
  List<Object?> get props => [];
}

class SelectRoleEvent extends RoleEvent {
  final UserRole role;
  const SelectRoleEvent(this.role);

  @override
  List<Object?> get props => [role];
}

class ConfirmRoleEvent extends RoleEvent {
  const ConfirmRoleEvent();
}

class ResetRoleEvent extends RoleEvent {
  const ResetRoleEvent();
}
