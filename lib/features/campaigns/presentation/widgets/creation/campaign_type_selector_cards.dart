import 'package:flutter/material.dart';
import '../../../data/models/campaign_model.dart';
import 'campaign_type_card.dart';

class CampaignTypeSelectorCards extends StatelessWidget {
  final CampaignAccessType selectedType;
  final ValueChanged<CampaignAccessType> onTypeChanged;

  const CampaignTypeSelectorCards({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CampaignTypeCard(
            type: CampaignAccessType.public,
            isSelected: selectedType == CampaignAccessType.public,
            badgeText: 'Open to All',
            title: 'Public',
            desc: 'Everyone can view and pitch to this brief',
            icon: Icons.public_rounded,
            onSelect: onTypeChanged,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: CampaignTypeCard(
            type: CampaignAccessType.private,
            isSelected: selectedType == CampaignAccessType.private,
            badgeText: 'Invite Only',
            title: 'Private',
            desc: 'Exclusive pitches from hand-picked creators',
            icon: Icons.lock_outline_rounded,
            onSelect: onTypeChanged,
          ),
        ),
      ],
    );
  }
}
