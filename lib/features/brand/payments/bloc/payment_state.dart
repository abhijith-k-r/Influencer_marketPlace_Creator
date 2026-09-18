import '../data/models/payment_filter_model.dart';
import '../data/models/payment_transaction_model.dart';

enum PaymentStatus { initial, loading, loaded, error }

class PaymentState {
  final PaymentStatus status;
  final List<PaymentTransactionModel> transactions;
  final PaymentTransactionModel? selectedTransaction;
  final PaymentFilterModel filter;
  final String activeQuickFilter;
  final double totalOutflow;
  final double pendingEscrow;
  final double completedEscrow;
  final String? errorMessage;

  const PaymentState({
    this.status = PaymentStatus.initial,
    this.transactions = const [],
    this.selectedTransaction,
    this.filter = PaymentFilterModel.initial,
    this.activeQuickFilter = 'All Transactions',
    this.totalOutflow = 485000.0,
    this.pendingEscrow = 65000.0,
    this.completedEscrow = 420000.0,
    this.errorMessage,
  });

  PaymentState copyWith({
    PaymentStatus? status,
    List<PaymentTransactionModel>? transactions,
    PaymentTransactionModel? selectedTransaction,
    PaymentFilterModel? filter,
    String? activeQuickFilter,
    double? totalOutflow,
    double? pendingEscrow,
    double? completedEscrow,
    String? errorMessage,
  }) {
    return PaymentState(
      status: status ?? this.status,
      transactions: transactions ?? this.transactions,
      selectedTransaction: selectedTransaction ?? this.selectedTransaction,
      filter: filter ?? this.filter,
      activeQuickFilter: activeQuickFilter ?? this.activeQuickFilter,
      totalOutflow: totalOutflow ?? this.totalOutflow,
      pendingEscrow: pendingEscrow ?? this.pendingEscrow,
      completedEscrow: completedEscrow ?? this.completedEscrow,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
