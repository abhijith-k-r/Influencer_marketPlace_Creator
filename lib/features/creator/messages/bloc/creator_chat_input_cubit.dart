import 'package:flutter_bloc/flutter_bloc.dart';

/// Cubit managing chat input text & quick replies for Creator thread (<35 LOC).
class CreatorChatInputCubit extends Cubit<String> {
  CreatorChatInputCubit() : super('');

  void setInput(String text) => emit(text);
  void clear() => emit('');
}
