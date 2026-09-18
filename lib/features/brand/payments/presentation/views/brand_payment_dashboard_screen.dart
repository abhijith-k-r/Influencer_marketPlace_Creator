import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_routes.dart';
import '../../../../../core/theme/app_colors.dart';
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

class BrandPaymentDashboardScreen extends StatefulWidget {
  const BrandPaymentDashboardScreen({super.key});

  @override
  State<BrandPaymentDashboardScreen> createState() =>
      _BrandPaymentDashboardScreenState();
}

class _BrandPaymentDashboardScreenState
    extends State<BrandPaymentDashboardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PaymentBloc>().add(const LoadPaymentsEvent());
  }

  void _onTransactionTap(PaymentTransactionModel tx) {
    context.read<PaymentBloc>().add(SelectTransactionEvent(tx));
    Navigator.of(context).pushNamed(AppRoutes.paymentDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<PaymentBloc, PaymentState>(
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
                    onExportTap: () {},
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: RecentTransactionsHeader(
                      totalCount: state.transactions.length,
                      onViewLedgerTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.paymentFilter),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) => PaymentTransactionTile(
                      transaction: state.transactions[i],
                      onTap: _onTransactionTap,
                    ),
                    childCount: state.transactions.length,
                  ),
                ),
                SliverToBoxAdapter(child: LoadOlderRecordsButton(onTap: () {})),
                const SliverToBoxAdapter(child: SizedBox(height: 80)),
              ],
            );
          },
        ),
      ),
    );
  }
}
