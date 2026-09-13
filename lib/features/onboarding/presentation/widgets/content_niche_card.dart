import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'audience_demographics_section.dart';
import 'content_categories_selector.dart';
import 'content_showcase_row.dart';
import 'content_style_grid.dart';
import 'primary_niche_grid.dart';

/// Card container combining Primary Niche, Showcases, Categories & Demographics.
class ContentNicheCard extends StatelessWidget {
  const ContentNicheCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedCard,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PrimaryNicheGrid(),
          SizedBox(height: 20),
          ContentShowcaseRow(),
          SizedBox(height: 20),
          ContentCategoriesSelector(),
          SizedBox(height: 20),
          ContentStyleGrid(),
          SizedBox(height: 20),
          AudienceDemographicsSection(),
        ],
      ),
    );
  }
}
