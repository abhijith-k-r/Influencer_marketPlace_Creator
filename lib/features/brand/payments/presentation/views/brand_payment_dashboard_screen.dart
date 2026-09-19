import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/shared/app_scaffold.dart';
import '../../bloc/payment_bloc.dart';
import '../../bloc/payment_event.dart';
import '../../bloc/payment_state.dart';
import '../../data/models/payment_transaction_model.dart';
import '../widgets/dashboard/load_older_records_button.dart';
import '../widgets/dashboard/payment_dashboard_header.dart';
import '../widgets/dashboard/payment_dashboard_overview_section.dart';
import '../widgets/dashboard/payment_filter_chips_row.dart';
import '../widgets/dashboard/payment_transaction_tile.dart';
import '../widgets/dashboard/recent_transactions_header.dart';

/// Pure StatelessWidget for Brand Payment Dashboard screen using AppScaffold (<90 LOC).
class BrandPaymentDashboardScreen extends StatelessWidget {
  const BrandPaymentDashboardScreen({super.key});

  void _onTransactionTap(BuildContext context, PaymentTransactionModel tx) {
    context.read<PaymentBloc>().add(SelectTransactionEvent(tx));
    Navigator.of(context).pushNamed(AppRoutes.paymentDetails);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.surface,
      useSafeArea: true,
      safeAreaBottom: false,
      body: BlocBuilder<PaymentBloc, PaymentState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: PaymentDashboardHeader(
                  onNotificationTap: () {},
                  onProfileTap: () {},
                ),
              ),
              SliverToBoxAdapter(
                child: PaymentDashboardOverviewSection(state: state),
              ),
              SliverToBoxAdapter(
                child: PaymentFilterChipsRow(
                  activeFilter: state.activeQuickFilter,
                  onFilterSelected: (f) => context
                      .read<PaymentBloc>()
                      .add(QuickFilterSelectedEvent(f)),
                ),
              ),
              SliverToBoxAdapter(
                child: RecentTransactionsHeader(
                  totalCount: state.transactions.length,
                  onViewLedgerTap: () => Navigator.of(context)
                      .pushNamed(AppRoutes.paymentFilter),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final tx = state.transactions[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: PaymentTransactionTile(
                          transaction: tx,
                          onTap: (t) => _onTransactionTap(context, t),
                        ),
                      );
                    },
                    childCount: state.transactions.length,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: LoadOlderRecordsButton(
                  onTap: () => context
                      .read<PaymentBloc>()
                      .add(const LoadMorePaymentsEvent()),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 32.0),
              ),
            ],
          );
        },
      ),
    );
  }
}
