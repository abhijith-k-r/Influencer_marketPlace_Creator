import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/auth_state.dart';
import 'auth_option_tile.dart';

/// Interactive login and sign-up method tiles for AuthBottomSheet.
class AuthOptionsSection extends StatelessWidget {
  final AuthState state;

  const AuthOptionsSection({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthOptionTile(
          backgroundColor: AppColors.primary,
          textColor: Colors.white,
          leadingIcon: Icons.phone_iphone_rounded,
          leadingBgColor: Colors.white.withValues(alpha: 0.18),
          leadingIconColor: Colors.white,
          title: 'Continue with Phone',
          trailingBadgeText: 'FASTEST',
          trailingBadgeBg: Colors.white.withValues(alpha: 0.2),
          trailingBadgeColor: Colors.white,
          isLoading: state.status == AuthStatus.authenticating,
          onTap: () => context.read<AuthBloc>().add(const AuthenticateWithPhoneEvent()),
        ),
        const SizedBox(height: 10),
        AuthOptionTile(
          backgroundColor: AppColors.surfaceContainerLow,
          textColor: AppColors.onSurface,
          leadingIcon: Icons.g_mobiledata_rounded,
          leadingBgColor: Colors.white,
          leadingIconColor: Colors.redAccent,
          title: 'Continue with Google',
          onTap: () => context.read<AuthBloc>().add(const AuthenticateWithGoogleEvent()),
        ),
        const SizedBox(height: 10),
        AuthOptionTile(
          backgroundColor: AppColors.surfaceContainerLow,
          textColor: AppColors.onSurface,
          leadingIcon: Icons.apple_rounded,
          leadingBgColor: Colors.black,
          leadingIconColor: Colors.white,
          title: 'Continue with Apple',
          onTap: () => context.read<AuthBloc>().add(const AuthenticateWithAppleEvent()),
        ),
        const SizedBox(height: 10),
        AuthOptionTile(
          backgroundColor: AppColors.surfaceContainerLow,
          textColor: AppColors.onSurface,
          leadingIcon: Icons.mail_outline_rounded,
          leadingBgColor: AppColors.surfaceContainerHigh,
          leadingIconColor: AppColors.onSurface,
          title: 'Continue with Email',
          onTap: () => context.read<AuthBloc>().add(const AuthenticateWithEmailEvent()),
        ),
      ],
    );
  }
}
