import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../bloc/auth_bloc.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/auth_state.dart';

/// Modal bottom sheet matching HTML "Log in or Sign up" Fast-Track Pass modal.
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.emerald,
              content: Text(
                'Welcome, ${state.userName ?? 'User'}!',
                style: AppTextStyles.labelMd(color: Colors.white),
              ),
            ),
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
              // Grab Handle
              Center(
                child: Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.onSurface.withValues(alpha: 0.15),
                    borderRadius: AppRadii.roundedPill,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Header Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Fast-Track Pass badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: AppRadii.roundedPill,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.stars_rounded,
                                size: 14,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'FAST-TRACK PASS',
                                style: AppTextStyles.labelSm(
                                  color: AppColors.primary,
                                ).copyWith(
                                  letterSpacing: 0.8,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Log in or Sign up',
                          style: AppTextStyles.headlineMd(
                            color: AppColors.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Join thousands of verified brands & creators collaborating today',
                          style: AppTextStyles.bodySm(
                            color: AppColors.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Close button
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    borderRadius: AppRadii.roundedPill,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: const BoxDecoration(
                        color: AppColors.surfaceContainer,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Option 1: Continue with Phone
              _buildAuthButton(
                context: context,
                backgroundColor: AppColors.primary,
                textColor: Colors.white,
                leadingIcon: Icons.phone_iphone_rounded,
                leadingBgColor: Colors.white.withValues(alpha: 0.18),
                leadingIconColor: Colors.white,
                title: 'Continue with Phone',
                trailingBadgeText: 'FASTEST',
                trailingBadgeBg: Colors.white.withValues(alpha: 0.2),
                trailingBadgeColor: Colors.white,
                trailingIcon: Icons.chevron_right,
                trailingIconColor: Colors.white.withValues(alpha: 0.8),
                isLoading: state.status == AuthStatus.authenticating,
                onTap: () {
                  context
                      .read<AuthBloc>()
                      .add(const AuthenticateWithPhoneEvent());
                },
              ),

              const SizedBox(height: 10),

              // Option 2: Continue with Google
              _buildAuthButton(
                context: context,
                backgroundColor: AppColors.surfaceContainerLow,
                textColor: AppColors.onSurface,
                leadingWidget: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'G',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF4285F4),
                      ),
                    ),
                  ),
                ),
                title: 'Continue with Google',
                trailingIcon: Icons.chevron_right,
                trailingIconColor: AppColors.tertiary,
                onTap: () {
                  context
                      .read<AuthBloc>()
                      .add(const AuthenticateWithGoogleEvent());
                },
              ),

              const SizedBox(height: 10),

              // Option 3: Continue with Apple
              _buildAuthButton(
                context: context,
                backgroundColor: AppColors.inverseSurface,
                textColor: AppColors.inverseOnSurface,
                leadingIcon: Icons.apple,
                leadingBgColor: Colors.white.withValues(alpha: 0.12),
                leadingIconColor: Colors.white,
                title: 'Continue with Apple',
                trailingIcon: Icons.chevron_right,
                trailingIconColor: Colors.white.withValues(alpha: 0.7),
                onTap: () {
                  context
                      .read<AuthBloc>()
                      .add(const AuthenticateWithAppleEvent());
                },
              ),

              const SizedBox(height: 10),

              // Option 4: Continue with Email
              _buildAuthButton(
                context: context,
                backgroundColor: AppColors.surfaceContainerLow,
                textColor: AppColors.onSurface,
                leadingIcon: Icons.mail_outline_rounded,
                leadingBgColor: Colors.white,
                leadingIconColor: AppColors.tertiary,
                title: 'Continue with Email',
                trailingIcon: Icons.chevron_right,
                trailingIconColor: AppColors.tertiary,
                onTap: () {
                  context
                      .read<AuthBloc>()
                      .add(const AuthenticateWithEmailEvent());
                },
              ),

              const SizedBox(height: 16),

              // Institutional Trust Divider
              Row(
                children: [
                  const Expanded(
                    child: Divider(color: AppColors.surfaceContainerHigh),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      'INSTITUTIONAL TRUST',
                      style: AppTextStyles.labelSm(
                        color: AppColors.tertiary,
                      ).copyWith(letterSpacing: 0.8),
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: AppColors.surfaceContainerHigh),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Escrow-backed contracts pill
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.verified_user_rounded,
                          size: 18,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Escrow-backed contracts',
                          style: AppTextStyles.bodySm(
                            color: AppColors.onSurface,
                          ).copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Text(
                      '100% Secure',
                      style: AppTextStyles.labelSm(
                        color: AppColors.secondary,
                      ).copyWith(fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Legal Footer
              Center(
                child: Text(
                  'By continuing, you agree to our Terms of Service & Privacy Policy.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodySm(color: AppColors.tertiary),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAuthButton({
    required BuildContext context,
    required Color backgroundColor,
    required Color textColor,
    required String title,
    Widget? leadingWidget,
    IconData? leadingIcon,
    Color? leadingBgColor,
    Color? leadingIconColor,
    String? trailingBadgeText,
    Color? trailingBadgeBg,
    Color? trailingBadgeColor,
    IconData? trailingIcon,
    Color? trailingIconColor,
    bool isLoading = false,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isLoading ? null : onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    leadingWidget ??
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: leadingBgColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            leadingIcon,
                            size: 18,
                            color: leadingIconColor,
                          ),
                        ),
                    const SizedBox(width: 14),
                    Text(
                      title,
                      style: AppTextStyles.labelLg(color: textColor),
                    ),
                  ],
                ),
                if (isLoading)
                  const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                else
                  Row(
                    children: [
                      if (trailingBadgeText != null)
                        Container(
                          margin: const EdgeInsets.only(right: 6),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: trailingBadgeBg,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            trailingBadgeText,
                            style: AppTextStyles.labelSm(
                              color: trailingBadgeColor ?? Colors.white,
                            ).copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      if (trailingIcon != null)
                        Icon(
                          trailingIcon,
                          size: 18,
                          color: trailingIconColor,
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
