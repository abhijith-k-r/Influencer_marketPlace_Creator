import '../data/models/payment_filter_model.dart';
import '../data/models/payment_transaction_model.dart';

sealed class PaymentEvent {
  const PaymentEvent();
}

final class LoadPaymentsEvent extends PaymentEvent {
  const LoadPaymentsEvent();
}

final class SelectTransactionEvent extends PaymentEvent {
  final PaymentTransactionModel transaction;
  const SelectTransactionEvent(this.transaction);
}

final class UpdateFilterEvent extends PaymentEvent {
  final PaymentFilterModel filter;
  const UpdateFilterEvent(this.filter);
}

final class ResetFilterEvent extends PaymentEvent {
  const ResetFilterEvent();
}

final class QuickFilterSelectedEvent extends PaymentEvent {
  final String quickFilter;
  const QuickFilterSelectedEvent(this.quickFilter);
}

final class LoadMorePaymentsEvent extends PaymentEvent {
  const LoadMorePaymentsEvent();
}
