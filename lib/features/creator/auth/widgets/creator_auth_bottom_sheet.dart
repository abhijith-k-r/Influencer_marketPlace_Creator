import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';
import '../../../auth/bloc/auth_bloc.dart';
import '../../../auth/bloc/auth_state.dart';
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: CreatorColors.primary,
              content: Text('Welcome, ${state.userName ?? 'Creator'}!', style: AppTextStyles.labelMd(color: Colors.white)),
            ),
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
