import 'package:equatable/equatable.dart';
import '../data/models/user_role.dart';

class RoleState extends Equatable {
  final UserRole? selectedRole;
  final bool isConfirmed;

  const RoleState({
    this.selectedRole,
    this.isConfirmed = false,
  });

  bool get hasSelection => selectedRole != null;

  RoleState copyWith({
    UserRole? selectedRole,
    bool? isConfirmed,
  }) {
    return RoleState(
      selectedRole: selectedRole ?? this.selectedRole,
      isConfirmed: isConfirmed ?? this.isConfirmed,
    );
  }

  @override
  List<Object?> get props => [selectedRole, isConfirmed];
}
