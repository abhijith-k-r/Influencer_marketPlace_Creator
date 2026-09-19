import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/widgets/shared/app_progress_indicator.dart';
import '../../bloc/profile_bloc.dart';
import '../../bloc/profile_event.dart';
import '../../bloc/profile_state.dart';

/// Full-width animated logout button for the Brand Profile screen.
class BrandLogoutButton extends StatelessWidget {
  const BrandLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final status =
        context.select<ProfileBloc, LogoutStatus>((b) => b.state.logoutStatus);
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: status == LogoutStatus.loggingOut
              ? null
              : () => context
                  .read<ProfileBloc>()
                  .add(const LogOutRequestedEvent()),
          borderRadius: BorderRadius.circular(16),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (status == LogoutStatus.loggingOut) ...[
                  const AppProgressIndicator.inline(size: 18, strokeWidth: 2),
                  const SizedBox(width: 10),
                  Text('Securing Session...',
                      style: AppTextStyles.labelLg(color: Colors.white)
                          .copyWith(fontWeight: FontWeight.w700)),
                ] else if (status == LogoutStatus.loggedOut) ...[
                  const Icon(Icons.check_circle_rounded,
                      size: 20, color: Colors.white),
                  const SizedBox(width: 8),
                  Text('Signed Out',
                      style: AppTextStyles.labelLg(color: Colors.white)
                          .copyWith(fontWeight: FontWeight.w700)),
                ] else ...[
                  const Icon(Icons.logout_rounded, size: 20, color: Colors.white),
                  const SizedBox(width: 8),
                  Text('Log Out',
                      style: AppTextStyles.labelLg(color: Colors.white)
                          .copyWith(fontWeight: FontWeight.w700)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
