import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../bloc/signin_bloc.dart';
import '../bloc/signin_state.dart';
import '../widgets/auth_benefit_ribbon.dart';
import '../widgets/signin_active_creators_badge.dart';
import '../widgets/signin_form_fields.dart';
import '../widgets/signin_header.dart';
import '../widgets/signup_card.dart';

/// Sign In screen assembled with responsive layout and state listener.
class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SigninBloc(),
      child: BlocListener<SigninBloc, SigninState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status == SigninStatus.success) {
            Navigator.pushReplacementNamed(context, AppRoutes.mainShell);
          }
        },
        child: const AppScaffold(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SigninHeader(),
              AppSpacing.verticalLg,
              SigninActiveCreatorsBadge(),
              AppSpacing.verticalLg,
              SignupCard(child: SigninFormFields()),
              AppSpacing.verticalLg,
              AuthBenefitRibbon(),
              AppSpacing.verticalXl,
            ],
          ),
        ),
      ),
    );
  }
}
