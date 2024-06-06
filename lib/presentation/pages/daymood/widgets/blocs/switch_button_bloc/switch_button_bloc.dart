import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'switch_button_event.dart';
part 'switch_button_state.dart';

class SwitchButtonBloc extends Bloc<SwitchButtonEvent, SwitchButtonState> {
  SwitchButtonBloc() : super(const SwitchButtonInitial()) {
    on<GetSelectedFirstIndexEvent>(_getFirstSelectedIndex);
    on<GetSelectedSecondIndexEvent>(_getSecondSelectedIndex);
  }

  void _getFirstSelectedIndex(
      GetSelectedFirstIndexEvent event, Emitter<SwitchButtonState> emit) {
    emit(SwitchButtonSelectedFirst(selectedIndex: event.selectedIndex));
  }

  void _getSecondSelectedIndex(
      GetSelectedSecondIndexEvent event, Emitter<SwitchButtonState> emit) {
    emit(SwitchButtonSelectedSecond(selectedIndex: event.selectedIndex));
  }
}
