import 'package:flutter_bloc/flutter_bloc.dart';
import 'role_event.dart';
import 'role_state.dart';
import '../data/models/user_role.dart';

class RoleBloc extends Bloc<RoleEvent, RoleState> {
  RoleBloc({UserRole? initialRole})
      : super(RoleState(selectedRole: initialRole)) {
    on<SelectRoleEvent>((event, emit) {
      emit(state.copyWith(selectedRole: event.role, isConfirmed: false));
    });

    on<ConfirmRoleEvent>((event, emit) {
      if (state.selectedRole != null) {
        emit(state.copyWith(isConfirmed: true));
      }
    });

    on<ResetRoleEvent>((event, emit) {
      emit(const RoleState(selectedRole: null, isConfirmed: false));
    });
  }
}
