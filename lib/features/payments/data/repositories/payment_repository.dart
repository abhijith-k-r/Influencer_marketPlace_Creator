import '../datasources/mock_payment_data.dart';
import '../models/payment_filter_model.dart';
import '../models/payment_transaction_model.dart';

abstract class PaymentRepository {
  Future<List<PaymentTransactionModel>> getTransactions({
    PaymentFilterModel? filter,
  });
  Future<PaymentTransactionModel?> getTransactionById(String id);
  Future<double> getTotalOutflow();
  Future<double> getPendingEscrow();
  Future<double> getCompletedEscrow();
}

class MockPaymentRepository implements PaymentRepository {
  final List<PaymentTransactionModel> _items = List.from(
    MockPaymentData.transactions,
  );

  @override
  Future<List<PaymentTransactionModel>> getTransactions({
    PaymentFilterModel? filter,
  }) async {
    await Future.delayed(const Duration(milliseconds: 150));
    if (filter == null) return List.unmodifiable(_items);

    return _items.where((tx) {
      if (filter.searchQuery.isNotEmpty) {
        final q = filter.searchQuery.toLowerCase();
        final matchCreator = tx.creatorName.toLowerCase().contains(q);
        final matchCampaign = tx.campaignTitle.toLowerCase().contains(q);
        final matchHandle = tx.creatorHandle?.toLowerCase().contains(q) ?? false;
        if (!matchCreator && !matchCampaign && !matchHandle) return false;
      }
      if (filter.selectedStatuses.isNotEmpty &&
          !filter.selectedStatuses.contains(tx.status)) {
        return false;
      }
      if (filter.selectedTypes.isNotEmpty &&
          !filter.selectedTypes.contains(tx.paymentType)) {
        return false;
      }
      if (tx.amount < filter.minAmount || tx.amount > filter.maxAmount) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Future<PaymentTransactionModel?> getTransactionById(String id) async {
    return _items.firstWhere((e) => e.id == id, orElse: () => _items.first);
  }

  @override
  Future<double> getTotalOutflow() async => 485000.0;

  @override
  Future<double> getPendingEscrow() async => 65000.0;

  @override
  Future<double> getCompletedEscrow() async => 420000.0;
}
