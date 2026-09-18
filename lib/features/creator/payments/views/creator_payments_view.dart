import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';

class CreatorPaymentsView extends StatelessWidget {
  const CreatorPaymentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CreatorColors.background,
      appBar: AppBar(
        title: Text('Payments', style: AppTextStyles.headlineMd(color: CreatorColors.onSurface)),
        backgroundColor: CreatorColors.surfaceContainerLowest,
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: CreatorColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.payments_outlined, size: 32, color: CreatorColors.primary),
              ),
              const SizedBox(height: 16),
              Text(
                'Creator Earnings & Escrow',
                style: AppTextStyles.headlineSm(color: CreatorColors.onSurface),
              ),
              const SizedBox(height: 8),
              Text(
                'Instant payout disbursements on milestone approval backed by Apple & Stripe Smart Vaults.',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMd(color: CreatorColors.outline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
