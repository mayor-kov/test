part of 'daymood_bloc.dart';

sealed class DayMoodEvent extends Equatable {
  const DayMoodEvent();

  @override
  List<Object> get props => [];
}

final class SelectedDayMoodEmotion extends DayMoodEvent {
  final bool sliderButtonEnable;
  final bool saveButtonEnable;
  const SelectedDayMoodEmotion(
      {required this.saveButtonEnable, required this.sliderButtonEnable});
}
