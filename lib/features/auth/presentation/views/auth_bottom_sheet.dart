import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/widgets/shared/app_snack_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_state.dart';
import '../widgets/auth_modal_header.dart';
import '../widgets/auth_modal_trust_footer.dart';
import '../widgets/auth_options_section.dart';

/// Modal bottom sheet for authentication, cleanly decomposed into sub-widgets (<70 LOC).
class AuthBottomSheet extends StatelessWidget {
  const AuthBottomSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AuthBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isAuthenticated) {
          Navigator.of(context).pop();
          AppSnackBar.showSuccess(
            context,
            'Welcome, ${state.userName ?? 'User'}!',
          );
        }
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 30,
                offset: Offset(0, -6),
              ),
            ],
          ),
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 12,
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthModalHeader(onClose: () => Navigator.of(context).pop()),
              const SizedBox(height: 20),
              AuthOptionsSection(state: state),
              const SizedBox(height: 20),
              const AuthModalTrustFooter(),
            ],
          ),
        );
      },
    );
  }
}
