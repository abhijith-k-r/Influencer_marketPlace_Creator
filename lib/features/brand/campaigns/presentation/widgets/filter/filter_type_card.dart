import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/campaign_model.dart';

class FilterTypeCard extends StatelessWidget {
  final CampaignAccessType? selectedType;
  final ValueChanged<CampaignAccessType?> onTypeSelected;

  const FilterTypeCard({
    super.key,
    required this.selectedType,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        boxShadow: const [BoxShadow(color: Color(0x060B1C30), blurRadius: 10, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.lock_open_rounded, size: 20, color: AppColors.tertiary),
                  const SizedBox(width: 8),
                  Text('Campaign Type', style: AppTextStyles.headlineSm(color: AppColors.onSurface)),
                ],
              ),
              Text('Access Level', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildTypeButton(
                  type: CampaignAccessType.public,
                  label: 'Public Campaign',
                  icon: Icons.public_rounded,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildTypeButton(
                  type: CampaignAccessType.private,
                  label: 'Private (Invite)',
                  icon: Icons.verified_user_rounded,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTypeButton({
    required CampaignAccessType type,
    required String label,
    required IconData icon,
  }) {
    final isSel = selectedType == type;
    return InkWell(
      onTap: () => onTypeSelected(isSel ? null : type),
      borderRadius: BorderRadius.circular(AppRadii.md),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: isSel ? AppColors.primary : AppColors.surfaceContainer,
          borderRadius: BorderRadius.circular(AppRadii.md),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: isSel ? AppColors.onPrimary : AppColors.tertiary),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: AppTextStyles.labelMd(color: isSel ? AppColors.onPrimary : AppColors.tertiary),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
