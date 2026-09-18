import 'package:flutter/material.dart';
import '../../../data/models/payment_filter_model.dart';
import '../../../data/models/payment_transaction_model.dart';
import 'filter_amount_range_section.dart';
import 'filter_date_range_section.dart';
import 'filter_payment_type_section.dart';
import 'filter_preview_banner.dart';
import 'filter_status_section.dart';
import 'payment_search_history_bar.dart';

class PaymentFilterFormBody extends StatelessWidget {
  final TextEditingController searchController;
  final PaymentFilterModel localFilter;
  final int matchingCount;
  final ValueChanged<String> onDatePresetSelected;
  final ValueChanged<PaymentTransactionStatus> onToggleStatus;
  final ValueChanged<PaymentType> onToggleType;
  final ValueChanged<String> onAmountPresetSelected;
  final ValueChanged<RangeValues> onRangeChanged;
  final ValueChanged<String> onTagTap;

  const PaymentFilterFormBody({
    super.key,
    required this.searchController,
    required this.localFilter,
    required this.matchingCount,
    required this.onDatePresetSelected,
    required this.onToggleStatus,
    required this.onToggleType,
    required this.onAmountPresetSelected,
    required this.onRangeChanged,
    required this.onTagTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          PaymentSearchHistoryBar(
            controller: searchController,
            onSearchSubmitted: (_) {},
            onClear: () => searchController.clear(),
            onTagTap: onTagTap,
          ),
          const SizedBox(height: 12),
          FilterDateRangeSection(
            activePreset: localFilter.datePreset,
            onPresetSelected: onDatePresetSelected,
          ),
          const SizedBox(height: 12),
          FilterStatusSection(
            selectedStatuses: localFilter.selectedStatuses,
            onToggleStatus: onToggleStatus,
          ),
          const SizedBox(height: 12),
          FilterPaymentTypeSection(
            selectedTypes: localFilter.selectedTypes,
            onToggleType: onToggleType,
          ),
          const SizedBox(height: 12),
          FilterAmountRangeSection(
            activePreset: localFilter.amountPreset ?? '',
            onPresetSelected: onAmountPresetSelected,
            rangeValues: RangeValues(localFilter.minAmount, localFilter.maxAmount),
            onRangeChanged: onRangeChanged,
          ),
          const SizedBox(height: 12),
          FilterPreviewBanner(matchingCount: matchingCount),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
