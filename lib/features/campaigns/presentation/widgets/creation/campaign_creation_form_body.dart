import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/campaign_bloc.dart';
import '../../../bloc/campaign_event.dart';
import '../../../data/models/campaign_milestone_model.dart';
import '../../../data/models/campaign_model.dart';
import 'campaign_basic_info_card.dart';
import 'campaign_budget_duration_card.dart';
import 'campaign_creation_form_sections.dart';
import 'campaign_escrow_milestone_card.dart';
import 'campaign_moodboard_gallery.dart';
import 'campaign_target_criteria_card.dart';
import 'campaign_type_selector_cards.dart';
import 'creation_bottom_actions.dart';
import 'creation_header_section.dart';

class CampaignCreationFormBody extends StatefulWidget {
  const CampaignCreationFormBody({super.key});

  @override
  State<CampaignCreationFormBody> createState() => _CampaignCreationFormBodyState();
}

class _CampaignCreationFormBodyState extends State<CampaignCreationFormBody> {
  final _titleController = TextEditingController(text: 'UrbanKicks Sneaker Gen-2 Drop');
  final _briefController = TextEditingController(text: 'Deliverables: 1x 45s Reel + 2 Stories.');
  final _budgetController = TextEditingController(text: '50000');
  String _category = 'Fashion & Streetwear';
  CampaignAccessType _type = CampaignAccessType.public;
  int _duration = 2;
  final Set<String> _platforms = {'Instagram', 'YouTube'};
  final Set<String> _niches = {'Streetwear'};
  final List<String> _media = ['https://images.unsplash.com/photo-1552346154-21d32810aba3'];
  final List<CampaignMilestoneModel> _milestones = List.from(defaultCreationMilestones);

  void _onPublish() {
    final campaign = createCampaignModel(
      title: _titleController.text.trim(),
      category: _category,
      type: _type,
      imageUrl: _media.first,
      budget: double.tryParse(_budgetController.text) ?? 50000,
      duration: _duration,
      brief: _briefController.text,
      milestones: _milestones,
      platforms: _platforms.toList(),
    );
    context.read<CampaignBloc>().add(CreateCampaignEvent(campaign));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        const CreationHeaderSection(),
        const SizedBox(height: 12),
        CampaignTypeSelectorCards(selectedType: _type, onTypeChanged: (t) => setState(() => _type = t)),
        const SizedBox(height: 16),
        CampaignBasicInfoCard(
          titleController: _titleController,
          selectedCategory: _category,
          onCategoryChanged: (c) => setState(() => _category = c ?? _category),
        ),
        const SizedBox(height: 16),
        CampaignMoodboardGallery(
          briefController: _briefController,
          mediaUrls: _media,
          onAddMedia: () {},
          onRemoveMedia: (i) => setState(() => _media.removeAt(i)),
        ),
        const SizedBox(height: 16),
        CampaignBudgetDurationCard(
          budgetController: _budgetController,
          selectedDuration: _duration,
          onDurationChanged: (d) => setState(() => _duration = d),
        ),
        const SizedBox(height: 16),
        CampaignEscrowMilestoneCard(
          milestones: _milestones,
          onAddMilestone: () => setState(() => _milestones.add(createSampleMilestone(_milestones.length + 1))),
          onDeleteMilestone: (i) => setState(() => _milestones.removeAt(i)),
        ),
        const SizedBox(height: 16),
        CampaignTargetCriteriaCard(
          selectedPlatforms: _platforms,
          selectedNiches: _niches,
          onTogglePlatform: (p) => setState(() => _platforms.contains(p) ? _platforms.remove(p) : _platforms.add(p)),
          onToggleNiche: (n) => setState(() => _niches.contains(n) ? _niches.remove(n) : _niches.add(n)),
        ),
        const SizedBox(height: 20),
        CreationBottomActions(onPublish: _onPublish, onSaveDraft: () => Navigator.of(context).pop()),
        const SizedBox(height: 24),
      ],
    );
  }
}
