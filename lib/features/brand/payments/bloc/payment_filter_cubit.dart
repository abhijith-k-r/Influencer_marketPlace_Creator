import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/payment_filter_model.dart';
import '../data/models/payment_transaction_model.dart';

/// Lightweight cubit managing in-flight payment filter parameters (<50 LOC).
class PaymentFilterCubit extends Cubit<PaymentFilterModel> {
  PaymentFilterCubit(super.initialFilter);

  void updateSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  void selectDatePreset(String preset) {
    emit(state.copyWith(datePreset: preset));
  }

  void toggleStatus(PaymentTransactionStatus status) {
    final set = Set<PaymentTransactionStatus>.of(state.selectedStatuses);
    set.contains(status) ? set.remove(status) : set.add(status);
    emit(state.copyWith(selectedStatuses: set));
  }

  void toggleType(PaymentType type) {
    final set = Set<PaymentType>.of(state.selectedTypes);
    set.contains(type) ? set.remove(type) : set.add(type);
    emit(state.copyWith(selectedTypes: set));
  }

  void selectAmountPreset(String preset) {
    emit(state.copyWith(amountPreset: preset));
  }

  void updateAmountRange(RangeValues range) {
    emit(state.copyWith(minAmount: range.start, maxAmount: range.end));
  }

  void resetAll() {
    emit(PaymentFilterModel.initial);
  }
}
