import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_routes.dart';
import 'package:creator_side/core/widgets/app_scaffold.dart';
import '../widgets/verification_action_buttons.dart';
import '../widgets/verification_checklist_card.dart';
import '../widgets/verification_delight_card.dart';
import '../widgets/verification_header_orb.dart';
import '../widgets/verification_status_banner.dart';
import '../widgets/verification_support_link.dart';

/// Creator Verification status screen matching Figma and exact HTML specs.
class VerificationStatusView extends StatelessWidget {
  const VerificationStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const VerificationHeaderOrb(),
          const SizedBox(height: 20),
          const VerificationStatusBanner(),
          const SizedBox(height: 16),
          const VerificationChecklistCard(),
          const SizedBox(height: 16),
          const VerificationDelightCard(),
          const SizedBox(height: 20),
          VerificationActionButtons(
            onCheckStatus: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Status up to date: 85% completed'),
                ),
              );
            },
            onBackToProfile: () {
              Navigator.pushReplacementNamed(context, AppRoutes.mainShell);
            },
          ),
          const SizedBox(height: 16),
          const VerificationSupportLink(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
