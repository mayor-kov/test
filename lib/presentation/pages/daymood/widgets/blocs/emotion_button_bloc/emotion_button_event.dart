part of 'emotion_button_bloc.dart';

sealed class EmotionButtonEvent extends Equatable {
  const EmotionButtonEvent();

  @override
  List<Object> get props => [];
}

final class GetSelectedIndexEvent extends EmotionButtonEvent {
  final int selectedIndex;

  const GetSelectedIndexEvent({
    required this.selectedIndex,
  });
}
