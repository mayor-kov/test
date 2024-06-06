part of 'emotion_button_bloc.dart';

sealed class EmotionButtonState extends Equatable {
  const EmotionButtonState();

  @override
  List<Object> get props => [];
}

final class EmotionButtonInitial extends EmotionButtonState {
  const EmotionButtonInitial({this.selectedIndex = -1});

  final int selectedIndex;

  @override
  List<Object> get props => [selectedIndex];
}

final class EmotionButtonSelectedIndex extends EmotionButtonState {
  const EmotionButtonSelectedIndex({this.selectedIndex = -1});

  final int selectedIndex;

  @override
  List<Object> get props => [selectedIndex];
}
