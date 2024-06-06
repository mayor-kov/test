import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'emotion_button_event.dart';
part 'emotion_button_state.dart';

class EmotionButtonBloc extends Bloc<EmotionButtonEvent, EmotionButtonState> {
  EmotionButtonBloc() : super(const EmotionButtonInitial()) {
    on<GetSelectedIndexEvent>(_getSelectedIndex);
  }

  void _getSelectedIndex(
      GetSelectedIndexEvent event, Emitter<EmotionButtonState> emit) {
    emit(EmotionButtonSelectedIndex(selectedIndex: event.selectedIndex));
  }
}
