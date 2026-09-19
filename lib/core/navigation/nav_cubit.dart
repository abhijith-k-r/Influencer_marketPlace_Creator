import 'package:flutter_bloc/flutter_bloc.dart';

/// Manages bottom navigation tab switching for Brand shell.
class BrandNavCubit extends Cubit<int> {
  BrandNavCubit() : super(0);

  void setTab(int index) => emit(index);
}

/// Manages bottom navigation tab switching for Creator shell.
class CreatorNavCubit extends Cubit<int> {
  CreatorNavCubit() : super(0);

  void setTab(int index) => emit(index);
}
