part of 'switch_button_bloc.dart';

sealed class SwitchButtonState extends Equatable {
  const SwitchButtonState();

  @override
  List<Object> get props => [];
}

final class SwitchButtonInitial extends SwitchButtonState {
  const SwitchButtonInitial({this.selectedIndex = 0});

  final int selectedIndex;

  @override
  List<Object> get props => [selectedIndex];
}

final class SwitchButtonSelectedFirst extends SwitchButtonState {
  const SwitchButtonSelectedFirst({this.selectedIndex = 0});

  final int selectedIndex;

  @override
  List<Object> get props => [selectedIndex];
}

final class SwitchButtonSelectedSecond extends SwitchButtonState {
  const SwitchButtonSelectedSecond({this.selectedIndex = 1});

  final int selectedIndex;

  @override
  List<Object> get props => [selectedIndex];
}
