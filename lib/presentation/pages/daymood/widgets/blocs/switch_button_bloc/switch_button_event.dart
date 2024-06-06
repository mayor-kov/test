part of 'switch_button_bloc.dart';

sealed class SwitchButtonEvent extends Equatable {
  const SwitchButtonEvent();

  @override
  List<Object> get props => [];
}

final class GetSelectedFirstIndexEvent extends SwitchButtonEvent {
  final int selectedIndex;

  const GetSelectedFirstIndexEvent({
    required this.selectedIndex,
  });
}

final class GetSelectedSecondIndexEvent extends SwitchButtonEvent {
  final int selectedIndex;

  const GetSelectedSecondIndexEvent({
    required this.selectedIndex,
  });
}
