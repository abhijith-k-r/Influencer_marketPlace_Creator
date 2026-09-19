import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../bloc/payment_bloc.dart';
import '../../bloc/payment_event.dart';
import '../../bloc/payment_filter_cubit.dart';
import '../../bloc/payment_state.dart';
import '../../data/models/payment_filter_model.dart';
import '../widgets/filter/filter_bottom_actions.dart';
import '../widgets/filter/payment_filter_form_body.dart';
import '../widgets/filter/payment_filter_top_bar.dart';

/// Pure StatelessWidget payment filter screen powered by PaymentFilterCubit (<80 LOC).
class BrandPaymentFilterScreen extends StatelessWidget {
  const BrandPaymentFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentFilter = context.read<PaymentBloc>().state.filter;

    return BlocProvider(
      create: (_) => PaymentFilterCubit(currentFilter),
      child: AppScaffold(
        backgroundColor: AppColors.surface,
        useSafeArea: true,
        body: BlocBuilder<PaymentBloc, PaymentState>(
          builder: (context, paymentState) {
            return BlocBuilder<PaymentFilterCubit, PaymentFilterModel>(
              builder: (context, filterState) {
                final cubit = context.read<PaymentFilterCubit>();
                final searchController = TextEditingController(text: filterState.searchQuery)
                  ..selection = TextSelection.fromPosition(
                    TextPosition(offset: filterState.searchQuery.length),
                  );

                return Column(
                  children: [
                    PaymentFilterTopBar(
                      onBackTap: () => Navigator.of(context).pop(),
                      onResetAllTap: () {
                        cubit.resetAll();
                        context.read<PaymentBloc>().add(const ResetFilterEvent());
                      },
                    ),
                    Expanded(
                      child: PaymentFilterFormBody(
                        searchController: searchController,
                        localFilter: filterState,
                        matchingCount: paymentState.transactions.length,
                        onDatePresetSelected: cubit.selectDatePreset,
                        onToggleStatus: cubit.toggleStatus,
                        onToggleType: cubit.toggleType,
                        onAmountPresetSelected: cubit.selectAmountPreset,
                        onRangeChanged: cubit.updateAmountRange,
                        onTagTap: cubit.updateSearchQuery,
                      ),
                    ),
                    FilterBottomActions(
                      resultsCount: paymentState.transactions.length,
                      onApply: () {
                        context.read<PaymentBloc>().add(UpdateFilterEvent(filterState));
                        Navigator.of(context).pop();
                      },
                      onClearAll: () {
                        cubit.resetAll();
                        context.read<PaymentBloc>().add(const ResetFilterEvent());
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
