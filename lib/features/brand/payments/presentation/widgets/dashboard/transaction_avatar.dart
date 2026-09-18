import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../data/models/payment_transaction_model.dart';
import 'payment_status_badge.dart';

class TransactionAvatar extends StatelessWidget {
  final String avatarUrl;
  final PaymentTransactionStatus status;

  const TransactionAvatar({
    super.key,
    required this.avatarUrl,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: AppColors.surfaceContainer,
          backgroundImage: NetworkImage(avatarUrl),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: PaymentStatusOrb(status: status),
        ),
      ],
    );
  }
}
