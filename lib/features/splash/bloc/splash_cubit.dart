import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SplashStatus { initial, complete }

/// Cubit managing the splash screen timeout and navigation readiness (<30 LOC).
class SplashCubit extends Cubit<SplashStatus> {
  Timer? _timer;

  SplashCubit() : super(SplashStatus.initial) {
    _timer = Timer(const Duration(milliseconds: 2400), completeSplash);
  }

  void completeSplash() {
    _timer?.cancel();
    if (state != SplashStatus.complete) {
      emit(SplashStatus.complete);
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
