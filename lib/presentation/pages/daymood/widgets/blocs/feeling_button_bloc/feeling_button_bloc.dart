import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'feeling_button_event.dart';
part 'feeling_button_state.dart';

class FeelingButtonBloc extends Bloc<FeelingButtonEvent, FeelingButtonState> {
  FeelingButtonBloc() : super(const FeelingButtonInitial()) {
    on<GetSelectedIndexEvent>(_getSelectedIndex);
  }

  void _getSelectedIndex(
      GetSelectedIndexEvent event, Emitter<FeelingButtonState> emit) {
    emit(FeelingButtonSelectedIndex(selectedIndex: event.selectedIndex));
  }
}
