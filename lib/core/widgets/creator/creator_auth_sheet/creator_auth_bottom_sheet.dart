import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/widgets/shared/app_snack_bar.dart';
import '../../../theme/creator_colors.dart';
import '../../../../features/auth/bloc/auth_bloc.dart';
import '../../../../features/auth/bloc/auth_state.dart';
import 'creator_auth_header.dart';
import 'creator_auth_options_list.dart';
import 'creator_auth_trust_footer.dart';

class CreatorAuthBottomSheet extends StatelessWidget {
  const CreatorAuthBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CreatorAuthBottomSheet(),
    );
  }

  bool _hasAuthBloc(BuildContext context) {
    try {
      context.read<AuthBloc>();
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasAuthBloc(context)) {
      return _buildSheet(context, null);
    }

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isAuthenticated) {
          Navigator.of(context).pop();
          AppSnackBar.showSuccess(
            context,
            'Welcome, ${state.userName ?? 'Creator'}!',
          );
        }
      },
      builder: (context, state) => _buildSheet(context, state),
    );
  }

  Widget _buildSheet(BuildContext context, AuthState? state) {
    return Container(
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 30, offset: Offset(0, -6))],
      ),
      padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: MediaQuery.of(context).viewInsets.bottom + 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CreatorAuthHeader(),
          const SizedBox(height: 20),
          CreatorAuthOptionsList(state: state),
          const SizedBox(height: 16),
          const CreatorAuthTrustFooter(),
        ],
      ),
    );
  }
}
