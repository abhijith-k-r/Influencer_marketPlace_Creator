import 'payment_transaction_model.dart';

class PaymentFilterModel {
  final String searchQuery;
  final String datePreset;
  final String fromDate;
  final String toDate;
  final Set<PaymentTransactionStatus> selectedStatuses;
  final Set<PaymentType> selectedTypes;
  final String? amountPreset;
  final double minAmount;
  final double maxAmount;

  const PaymentFilterModel({
    this.searchQuery = '',
    this.datePreset = 'This Month',
    this.fromDate = '01 Oct 2024',
    this.toDate = '24 Oct 2024',
    this.selectedStatuses = const {
      PaymentTransactionStatus.paid,
      PaymentTransactionStatus.pendingEscrow,
    },
    this.selectedTypes = const {
      PaymentType.initialAdvance,
      PaymentType.milestoneRelease,
    },
    this.amountPreset = '₹10,000 – ₹50,000',
    this.minAmount = 10000.0,
    this.maxAmount = 75000.0,
  });

  PaymentFilterModel copyWith({
    String? searchQuery,
    String? datePreset,
    String? fromDate,
    String? toDate,
    Set<PaymentTransactionStatus>? selectedStatuses,
    Set<PaymentType>? selectedTypes,
    String? amountPreset,
    double? minAmount,
    double? maxAmount,
  }) {
    return PaymentFilterModel(
      searchQuery: searchQuery ?? this.searchQuery,
      datePreset: datePreset ?? this.datePreset,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
      selectedStatuses: selectedStatuses ?? this.selectedStatuses,
      selectedTypes: selectedTypes ?? this.selectedTypes,
      amountPreset: amountPreset ?? this.amountPreset,
      minAmount: minAmount ?? this.minAmount,
      maxAmount: maxAmount ?? this.maxAmount,
    );
  }

  static const initial = PaymentFilterModel();
}
