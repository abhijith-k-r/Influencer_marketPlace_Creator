import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import 'package:creator_side/features/creator/my_works/data/models/creator_work_item.dart';
import 'package:creator_side/features/creator/my_works/data/models/mock_creator_work_details_data.dart';
import 'package:creator_side/features/creator/my_works/data/models/mock_creator_works_data.dart';
import '../widgets/details/work_brand_feedback_card.dart';
import '../widgets/details/work_creative_assets_section.dart';
import '../widgets/details/work_deliverables_checklist.dart';
import '../widgets/details/work_details_action_bar.dart';
import '../widgets/details/work_details_app_bar.dart';
import '../widgets/details/work_details_hero_card.dart';
import '../widgets/details/work_payment_milestones_card.dart';

/// Screen detailing campaign work deliverables, escrow, assets, and milestones.
class CreatorWorkDetailsView extends StatelessWidget {
  final CreatorWorkItem? item;

  const CreatorWorkDetailsView({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    final routeItem = ModalRoute.of(context)?.settings.arguments as CreatorWorkItem?;
    final activeItem = item ?? routeItem ?? MockCreatorWorksData.items.first;

    return AppScaffold(
      backgroundColor: CreatorColors.background,
      useSafeArea: true,
      body: Column(
          children: [
            WorkDetailsAppBar(onBack: () => Navigator.of(context).pop()),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  WorkDetailsHeroCard(item: activeItem),
                  const SizedBox(height: 16),
                  const WorkDeliverablesChecklist(
                    deliverables: MockCreatorWorkDetailsData.deliverables,
                  ),
                  const SizedBox(height: 16),
                  const WorkCreativeAssetsSection(),
                  const SizedBox(height: 16),
                  const WorkPaymentMilestonesCard(
                    milestones: MockCreatorWorkDetailsData.milestones,
                  ),
                  const SizedBox(height: 16),
                  const WorkBrandFeedbackCard(),
                  const SizedBox(height: 16),
                  WorkDetailsActionBar(
                    onContactBrand: () {},
                    onWithdraw: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
