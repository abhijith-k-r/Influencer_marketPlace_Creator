import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import '../widgets/redeem/creator_redeem_action_section.dart';
import '../widgets/redeem/creator_redeem_amount_box.dart';
import '../widgets/redeem/creator_redeem_breakdown_card.dart';
import '../widgets/redeem/creator_redeem_campaign_header.dart';
import '../widgets/redeem/creator_redeem_destination_box.dart';

class CreatorPaymentRedeemView extends StatelessWidget {
  const CreatorPaymentRedeemView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: CreatorColors.background,
      appBar: AppBar(
        backgroundColor: CreatorColors.surfaceContainerLowest,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          color: CreatorColors.onSurface,
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          'Redeem Milestone Payout',
          style: AppTextStyles.headlineMd(
            color: CreatorColors.onSurface,
          ).copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 36),
        children: [
          const CreatorRedeemCampaignHeader(),
          const SizedBox(height: 16),
          const CreatorRedeemAmountBox(),
          const SizedBox(height: 16),
          const CreatorRedeemDestinationBox(),
          const SizedBox(height: 16),
          const CreatorRedeemBreakdownCard(),
          const SizedBox(height: 24),
          CreatorRedeemActionSection(
            onCompleted: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
