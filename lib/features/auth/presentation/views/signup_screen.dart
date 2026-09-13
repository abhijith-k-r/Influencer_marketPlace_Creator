import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../bloc/signup_bloc.dart';
import '../bloc/signup_state.dart';
import '../widgets/bento_perks_row.dart';
import '../widgets/community_proof_footer.dart';
import '../widgets/signup_ambient_background.dart';
import '../widgets/signup_card.dart';
import '../widgets/signup_form_fields.dart';
import '../widgets/signup_header_section.dart';
import '../widgets/top_creators_teaser_card.dart';
import '../widgets/trust_indicators_bar.dart';

/// Main Creator Signup Screen assembled with modular, stateless components.
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignupBloc(),
      child: BlocListener<SignupBloc, SignupState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == SignupStatus.success) {
            Navigator.pushReplacementNamed(context, AppRoutes.onboardingStep1);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
          body: SignupAmbientBackground(
            child: Center(
              child: SingleChildScrollView(
                padding: AppSpacing.paddingScreen,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SignupHeaderSection(),
                      AppSpacing.verticalLg,
                      TopCreatorsTeaserCard(),
                      AppSpacing.verticalLg,
                      SignupCard(child: SignupFormFields()),
                      AppSpacing.verticalLg,
                      TrustIndicatorsBar(),
                      AppSpacing.verticalLg,
                      BentoPerksRow(),
                      AppSpacing.verticalLg,
                      CommunityProofFooter(),
                      AppSpacing.verticalXl,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
