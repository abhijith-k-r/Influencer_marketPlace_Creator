import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/campaign_creator_applicant_model.dart';

class CreatorAvatarStack extends StatelessWidget {
  final List<CampaignCreatorApplicantModel> applicants;
  final int totalCount;

  const CreatorAvatarStack({
    super.key,
    required this.applicants,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    final overflow = totalCount > applicants.length ? totalCount - applicants.length : 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 44,
          child: Row(
            children: [
              ...List.generate(applicants.length, (index) {
                final app = applicants[index];
                return Transform.translate(
                  offset: Offset(-8.0 * index, 0),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.surfaceContainerLowest, width: 2),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            app.avatarUrl,
                            width: 38,
                            height: 38,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => Container(
                              width: 38,
                              height: 38,
                              color: AppColors.surfaceContainerHigh,
                              child: const Icon(Icons.person, size: 20, color: AppColors.tertiary),
                            ),
                          ),
                        ),
                      ),
                      if (app.isVerified)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            padding: const EdgeInsets.all(1.5),
                            decoration: const BoxDecoration(
                              color: AppColors.surfaceContainerLowest,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.verified, size: 12, color: AppColors.secondary),
                          ),
                        ),
                    ],
                  ),
                );
              }),
              if (overflow > 0)
                Transform.translate(
                  offset: Offset(-8.0 * applicants.length, 0),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerHighest,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.surfaceContainerLowest, width: 2),
                    ),
                    alignment: Alignment.center,
                    child: Text('+$overflow', style: AppTextStyles.labelMd(color: AppColors.onSurface)),
                  ),
                ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Top Match', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
            Text('96% Fit', style: AppTextStyles.labelLg(color: AppColors.secondary)),
          ],
        ),
      ],
    );
  }
}
