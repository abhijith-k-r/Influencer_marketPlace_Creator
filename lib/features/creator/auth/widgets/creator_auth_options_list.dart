import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/creator_colors.dart';
import '../../../auth/bloc/auth_bloc.dart';
import '../../../auth/bloc/auth_event.dart';
import '../../../auth/bloc/auth_state.dart';
import 'creator_auth_button_tile.dart';

class CreatorAuthOptionsList extends StatelessWidget {
  final AuthState? state;

  const CreatorAuthOptionsList({super.key, this.state});

  void _dispatch(BuildContext context, AuthEvent event) {
    try {
      context.read<AuthBloc>().add(event);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final isAuth = state?.status == AuthStatus.authenticating;

    return Column(
      children: [
        CreatorAuthButtonTile(
          backgroundColor: CreatorColors.primary,
          textColor: Colors.white,
          leadingIcon: Icons.phone_iphone_rounded,
          leadingBgColor: Colors.white.withValues(alpha: 0.18),
          leadingIconColor: Colors.white,
          title: 'Continue with Phone',
          badgeText: 'FASTEST',
          badgeBg: Colors.white.withValues(alpha: 0.2),
          isLoading: isAuth,
          onTap: () => _dispatch(context, const AuthenticateWithPhoneEvent()),
        ),
        const SizedBox(height: 10),
        CreatorAuthButtonTile(
          backgroundColor: CreatorColors.surfaceContainerLow,
          textColor: CreatorColors.onSurface,
          leading: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 4)],
            ),
            child: const Center(
              child: Text('G', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Color(0xFF4285F4))),
            ),
          ),
          title: 'Continue with Google',
          trailingIconColor: CreatorColors.outline,
          onTap: () => _dispatch(context, const AuthenticateWithGoogleEvent()),
        ),
        const SizedBox(height: 10),
        CreatorAuthButtonTile(
          backgroundColor: CreatorColors.onSurface,
          textColor: Colors.white,
          leadingIcon: Icons.apple,
          leadingBgColor: Colors.white.withValues(alpha: 0.12),
          leadingIconColor: Colors.white,
          title: 'Continue with Apple',
          trailingIconColor: Colors.white.withValues(alpha: 0.7),
          onTap: () => _dispatch(context, const AuthenticateWithAppleEvent()),
        ),
        const SizedBox(height: 10),
        CreatorAuthButtonTile(
          backgroundColor: CreatorColors.surfaceContainerLow,
          textColor: CreatorColors.onSurface,
          leadingIcon: Icons.mail_outline_rounded,
          leadingBgColor: Colors.white,
          leadingIconColor: CreatorColors.outline,
          title: 'Continue with Email',
          trailingIconColor: CreatorColors.outline,
          onTap: () => _dispatch(context, const AuthenticateWithEmailEvent()),
        ),
      ],
    );
  }
}
