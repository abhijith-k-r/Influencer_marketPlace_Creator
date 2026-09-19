import 'package:flutter/material.dart';
import '../../../../../../core/widgets/shared/app_network_avatar.dart';
import '../../../data/models/payment_transaction_model.dart';
import 'payment_status_badge.dart';

/// Transaction avatar with status orb using global AppNetworkAvatar (<35 LOC).
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
        AppNetworkAvatar(
          radius: 22,
          imageUrl: avatarUrl.isNotEmpty ? avatarUrl : null,
          fallbackIcon: Icons.person_rounded,
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
