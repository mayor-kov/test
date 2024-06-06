import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'daymood_event.dart';
part 'daymood_state.dart';

class DayMoodBloc extends Bloc<DayMoodEvent, DayMoodState> {
  DayMoodBloc() : super(const DayMoodInitial()) {
    on<SelectedDayMoodEmotion>(_selectedDayMoodEmotion);
  }

  void _selectedDayMoodEmotion(
      SelectedDayMoodEmotion event, Emitter<DayMoodState> emit) {
    emit(const DayMoodInitial());
    emit(DayMoodSelectedEmotion(
        sliderButtonEnable: event.sliderButtonEnable,
        saveButtonEnable: event.saveButtonEnable));
  }
}
