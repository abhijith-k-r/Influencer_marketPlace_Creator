import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class CreateCampaignMiniBanner extends StatelessWidget {
  final VoidCallback onTap;

  const CreateCampaignMiniBanner({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadii.xl),
      child: Container(
        height: 104,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadii.xl),
          gradient: const LinearGradient(
            colors: [AppColors.primary, AppColors.primaryContainer, AppColors.secondaryContainer],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: const [BoxShadow(color: Color(0x20B9092F), blurRadius: 16, offset: Offset(0, 6))],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -24,
              bottom: -32,
              child: Container(
                width: 112,
                height: 112,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.1)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('SCALE YOUR REACH', style: AppTextStyles.labelSm(color: AppColors.primaryFixed.withValues(alpha: 0.9))),
                        const SizedBox(height: 2),
                        Text('Create New Campaign', style: AppTextStyles.headlineSm(color: AppColors.onPrimary)),
                        const SizedBox(height: 2),
                        Text(
                          'Connect with 10k+ verified high-ROI creators',
                          style: AppTextStyles.bodySm(color: AppColors.primaryFixedDim),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withValues(alpha: 0.2)),
                    child: const Icon(Icons.add_rounded, color: AppColors.onPrimary, size: 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
