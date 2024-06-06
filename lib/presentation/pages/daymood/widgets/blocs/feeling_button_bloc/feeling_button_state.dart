part of 'feeling_button_bloc.dart';

sealed class FeelingButtonState extends Equatable {
  const FeelingButtonState();

  @override
  List<Object> get props => [];
}

final class FeelingButtonInitial extends FeelingButtonState {
  const FeelingButtonInitial({this.selectedIndex = -1});

  final int selectedIndex;

  @override
  List<Object> get props => [selectedIndex];
}

final class FeelingButtonSelectedIndex extends FeelingButtonState {
  const FeelingButtonSelectedIndex({this.selectedIndex = -1});

  final int selectedIndex;

  @override
  List<Object> get props => [selectedIndex];
}
