import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/campaign_bloc.dart';
import '../../../bloc/campaign_event.dart';
import '../../../data/models/campaign_filter_model.dart';
import '../../../data/models/campaign_model.dart';
import 'filter_bottom_action_buttons.dart';
import 'filter_budget_slider_card.dart';
import 'filter_curated_insight_box.dart';
import 'filter_date_range_card.dart';
import 'filter_header_bar.dart';
import 'filter_live_sync_banner.dart';
import 'filter_platforms_niche_card.dart';
import 'filter_status_card.dart';
import 'filter_type_card.dart';

class CampaignFilterFormBody extends StatefulWidget {
  const CampaignFilterFormBody({super.key});

  @override
  State<CampaignFilterFormBody> createState() => _CampaignFilterFormBodyState();
}

class _CampaignFilterFormBodyState extends State<CampaignFilterFormBody> {
  late CampaignFilterModel _filter;

  @override
  void initState() {
    super.initState();
    _filter = context.read<CampaignBloc>().state.filter;
  }

  void _onApply() {
    context.read<CampaignBloc>().add(ApplyFilterEvent(_filter));
    Navigator.of(context).pop();
  }

  void _onReset() {
    setState(() => _filter = CampaignFilterModel.initial);
    context.read<CampaignBloc>().add(const ResetFilterEvent());
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      children: [
        FilterHeaderBar(onBack: () => Navigator.of(context).pop(), onResetAll: _onReset),
        const SizedBox(height: 12),
        const FilterLiveSyncBanner(count: 5),
        const SizedBox(height: 14),
        FilterDateRangeCard(
          selectedPreset: _filter.datePreset,
          fromDate: _filter.fromDate,
          toDate: _filter.toDate,
          onPresetSelected: (p) => setState(() => _filter = _filter.copyWith(datePreset: p)),
        ),
        const SizedBox(height: 14),
        FilterStatusCard(
          selectedStatuses: _filter.selectedStatuses,
          onToggleStatus: (s) => setState(() {
            final next = Set<CampaignStatus>.from(_filter.selectedStatuses);
            next.contains(s) ? next.remove(s) : next.add(s);
            _filter = _filter.copyWith(selectedStatuses: next);
          }),
        ),
        const SizedBox(height: 14),
        FilterTypeCard(
          selectedType: _filter.selectedAccessType,
          onTypeSelected: (t) => setState(() => _filter = _filter.copyWith(selectedAccessType: t, clearAccessType: t == null)),
        ),
        const SizedBox(height: 14),
        FilterBudgetSliderCard(
          minBudget: _filter.minBudget,
          maxBudget: _filter.maxBudget,
          onRangeChanged: (r) => setState(() => _filter = _filter.copyWith(minBudget: r.start, maxBudget: r.end)),
          onPresetBudgetSelected: (b) => setState(() => _filter = _filter.copyWith(maxBudget: b)),
        ),
        const SizedBox(height: 14),
        FilterPlatformsNicheCard(
          selectedPlatforms: _filter.selectedPlatforms,
          selectedNiches: _filter.selectedNiches,
          onTogglePlatform: (p) => setState(() => _filter = _filter.copyWith(selectedPlatforms: _toggleSet(_filter.selectedPlatforms, p))),
          onToggleNiche: (n) => setState(() => _filter = _filter.copyWith(selectedNiches: _toggleSet(_filter.selectedNiches, n))),
        ),
        const SizedBox(height: 14),
        const FilterCuratedInsightBox(),
        const SizedBox(height: 20),
        FilterBottomActionButtons(matchCount: 5, onApply: _onApply, onReset: _onReset),
        const SizedBox(height: 24),
      ],
    );
  }

  Set<String> _toggleSet(Set<String> current, String item) {
    final copy = Set<String>.from(current);
    copy.contains(item) ? copy.remove(item) : copy.add(item);
    return copy;
  }
}
