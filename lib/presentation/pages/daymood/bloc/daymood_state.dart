part of 'daymood_bloc.dart';

sealed class DayMoodState extends Equatable {
  const DayMoodState();

  @override
  List<Object> get props => [];
}

final class DayMoodInitial extends DayMoodState {
  const DayMoodInitial();

  @override
  List<Object> get props => [];
}

final class DayMoodSelectedEmotion extends DayMoodState {
  final bool sliderButtonEnable;
  final bool saveButtonEnable;

  const DayMoodSelectedEmotion(
      {required this.saveButtonEnable, required this.sliderButtonEnable});

  @override
  List<Object> get props => [];
}
