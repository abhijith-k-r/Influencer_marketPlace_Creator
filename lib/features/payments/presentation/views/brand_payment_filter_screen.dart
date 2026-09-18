import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors.dart';
import '../../bloc/payment_bloc.dart';
import '../../bloc/payment_event.dart';
import '../../bloc/payment_state.dart';
import '../../data/models/payment_filter_model.dart';
import '../widgets/filter/filter_bottom_actions.dart';
import '../widgets/filter/payment_filter_form_body.dart';
import '../widgets/filter/payment_filter_top_bar.dart';

class BrandPaymentFilterScreen extends StatefulWidget {
  const BrandPaymentFilterScreen({super.key});

  @override
  State<BrandPaymentFilterScreen> createState() =>
      _BrandPaymentFilterScreenState();
}

class _BrandPaymentFilterScreenState extends State<BrandPaymentFilterScreen> {
  late final TextEditingController _searchController;
  late PaymentFilterModel _localFilter;

  @override
  void initState() {
    super.initState();
    _localFilter = context.read<PaymentBloc>().state.filter;
    _searchController = TextEditingController(text: _localFilter.searchQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applyFilter() {
    final updated = _localFilter.copyWith(
      searchQuery: _searchController.text.trim(),
    );
    context.read<PaymentBloc>().add(UpdateFilterEvent(updated));
    Navigator.of(context).pop();
  }

  void _resetAll() {
    setState(() {
      _localFilter = PaymentFilterModel.initial;
      _searchController.clear();
    });
    context.read<PaymentBloc>().add(const ResetFilterEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, state) {
            return Column(
              children: [
                PaymentFilterTopBar(
                  onBackTap: () => Navigator.of(context).pop(),
                  onResetAllTap: _resetAll,
                ),
                Expanded(
                  child: PaymentFilterFormBody(
                    searchController: _searchController,
                    localFilter: _localFilter,
                    matchingCount: state.transactions.length,
                    onDatePresetSelected: (p) => setState(
                      () => _localFilter = _localFilter.copyWith(datePreset: p),
                    ),
                    onToggleStatus: (s) => setState(() {
                      final set = Set.of(_localFilter.selectedStatuses);
                      set.contains(s) ? set.remove(s) : set.add(s);
                      _localFilter = _localFilter.copyWith(selectedStatuses: set);
                    }),
                    onToggleType: (t) => setState(() {
                      final set = Set.of(_localFilter.selectedTypes);
                      set.contains(t) ? set.remove(t) : set.add(t);
                      _localFilter = _localFilter.copyWith(selectedTypes: set);
                    }),
                    onAmountPresetSelected: (p) => setState(
                      () => _localFilter = _localFilter.copyWith(amountPreset: p),
                    ),
                    onRangeChanged: (r) => setState(
                      () => _localFilter = _localFilter.copyWith(
                        minAmount: r.start,
                        maxAmount: r.end,
                      ),
                    ),
                    onTagTap: (t) => setState(() => _searchController.text = t),
                  ),
                ),
                FilterBottomActions(
                  resultsCount: state.transactions.length,
                  onApply: _applyFilter,
                  onClearAll: _resetAll,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
