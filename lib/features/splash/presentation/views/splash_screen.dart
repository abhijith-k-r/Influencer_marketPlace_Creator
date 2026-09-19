import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../bloc/splash_cubit.dart';
import '../widgets/splash_footer.dart';
import '../widgets/splash_hero_content.dart';

/// Pure StatelessWidget animated splash screen powered by SplashCubit and AppScaffold (<65 LOC).
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _navigateToNext(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.roleSelection);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit(),
      child: BlocListener<SplashCubit, SplashStatus>(
        listener: (context, status) {
          if (status == SplashStatus.complete) {
            _navigateToNext(context);
          }
        },
        child: Builder(
          builder: (context) => AppScaffold(
            backgroundColor: AppColors.background,
            useSafeArea: true,
            body: GestureDetector(
              onTap: () {
                context.read<SplashCubit>().completeSplash();
                _navigateToNext(context);
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          gradient: AppColors.splashGradient,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.3),
                              blurRadius: 30,
                              offset: const Offset(0, 12),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: SplashHeroContent(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const SplashFooter(),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
