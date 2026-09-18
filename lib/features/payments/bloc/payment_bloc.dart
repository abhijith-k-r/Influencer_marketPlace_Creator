import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/payment_filter_model.dart';
import '../data/models/payment_transaction_model.dart';
import '../data/repositories/payment_repository.dart';
import 'payment_event.dart';
import 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepository _repository;

  PaymentBloc({PaymentRepository? repository})
      : _repository = repository ?? MockPaymentRepository(),
        super(const PaymentState()) {
    on<LoadPaymentsEvent>(_onLoadPayments);
    on<SelectTransactionEvent>(_onSelectTransaction);
    on<UpdateFilterEvent>(_onUpdateFilter);
    on<ResetFilterEvent>(_onResetFilter);
    on<QuickFilterSelectedEvent>(_onQuickFilterSelected);
  }

  Future<void> _onLoadPayments(
    LoadPaymentsEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(status: PaymentStatus.loading));
    try {
      final txs = await _repository.getTransactions(filter: state.filter);
      final outflow = await _repository.getTotalOutflow();
      final pending = await _repository.getPendingEscrow();
      final completed = await _repository.getCompletedEscrow();
      emit(state.copyWith(
        status: PaymentStatus.loaded,
        transactions: txs,
        selectedTransaction: txs.isNotEmpty ? txs.first : null,
        totalOutflow: outflow,
        pendingEscrow: pending,
        completedEscrow: completed,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: PaymentStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onSelectTransaction(
    SelectTransactionEvent event,
    Emitter<PaymentState> emit,
  ) {
    emit(state.copyWith(selectedTransaction: event.transaction));
  }

  Future<void> _onUpdateFilter(
    UpdateFilterEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(status: PaymentStatus.loading, filter: event.filter));
    final txs = await _repository.getTransactions(filter: event.filter);
    emit(state.copyWith(status: PaymentStatus.loaded, transactions: txs));
  }

  Future<void> _onResetFilter(
    ResetFilterEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(
      status: PaymentStatus.loading,
      filter: PaymentFilterModel.initial,
    ));
    final txs = await _repository.getTransactions(
      filter: PaymentFilterModel.initial,
    );
    emit(state.copyWith(status: PaymentStatus.loaded, transactions: txs));
  }

  Future<void> _onQuickFilterSelected(
    QuickFilterSelectedEvent event,
    Emitter<PaymentState> emit,
  ) async {
    emit(state.copyWith(activeQuickFilter: event.quickFilter));
    PaymentFilterModel newFilter = state.filter;
    if (event.quickFilter == 'Escrow Active') {
      newFilter = newFilter.copyWith(
        selectedStatuses: {PaymentTransactionStatus.pendingEscrow},
      );
    } else if (event.quickFilter == 'All Transactions') {
      newFilter = PaymentFilterModel.initial;
    }
    final txs = await _repository.getTransactions(filter: newFilter);
    emit(state.copyWith(transactions: txs, filter: newFilter));
  }
}
