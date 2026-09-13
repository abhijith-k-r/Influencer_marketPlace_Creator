import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../../features/auth/presentation/widgets/signup_ambient_background.dart';

/// Standard responsive scaffold providing ambient aura and max-width constraints.
class AppScaffold extends StatelessWidget {
  final Widget child;
  final Widget? bottomNavigationBar;
  final bool scrollable;
  final EdgeInsetsGeometry padding;

  const AppScaffold({
    super.key,
    required this.child,
    this.bottomNavigationBar,
    this.scrollable = true,
    this.padding = AppSpacing.paddingScreen,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Padding(padding: padding, child: child),
      ),
    );

    if (scrollable) {
      content = SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: content,
      );
    }

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SignupAmbientBackground(child: content),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
