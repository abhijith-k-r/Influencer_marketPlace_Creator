import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/payment_transaction_model.dart';

class PaymentStatusOrb extends StatelessWidget {
  final PaymentTransactionStatus status;

  const PaymentStatusOrb({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color bg = AppColors.secondary;
    IconData icon = Icons.check;
    if (status == PaymentTransactionStatus.pendingEscrow) {
      bg = AppColors.outline;
      icon = Icons.hourglass_empty;
    } else if (status == PaymentTransactionStatus.failed) {
      bg = AppColors.error;
      icon = Icons.close;
    }
    return Container(
      width: 14,
      height: 14,
      decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
      child: Icon(icon, size: 9, color: Colors.white),
    );
  }
}

class PaymentStatusPill extends StatelessWidget {
  final PaymentTransactionStatus status;

  const PaymentStatusPill({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    String text = 'Paid';
    Color bg = AppColors.secondaryFixed;
    Color textColor = AppColors.onSecondaryFixed;
    if (status == PaymentTransactionStatus.pendingEscrow) {
      text = 'Pending Escrow';
      bg = AppColors.surfaceContainerHigh;
      textColor = AppColors.onSurface;
    } else if (status == PaymentTransactionStatus.failed) {
      text = 'Failed / Reversed';
      bg = AppColors.errorContainer;
      textColor = AppColors.onErrorContainer;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadii.full),
      ),
      child: Text(text, style: AppTextStyles.labelSm(color: textColor)),
    );
  }
}
