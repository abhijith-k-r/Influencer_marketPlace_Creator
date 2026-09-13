import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Renders the soft ambient glow aura backdrop from the Figma design.
class SignupAmbientBackground extends StatelessWidget {
  final Widget child;

  const SignupAmbientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -40,
          left: 35,
          child: Container(
            width: 288,
            height: 288,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.ambientAuraGradient,
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 32, sigmaY: 32),
              child: const SizedBox.expand(),
            ),
          ),
        ),
        SafeArea(child: child),
      ],
    );
  }
}
