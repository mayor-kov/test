part of 'feeling_button_bloc.dart';

sealed class FeelingButtonEvent extends Equatable {
  const FeelingButtonEvent();

  @override
  List<Object> get props => [];
}

final class GetSelectedIndexEvent extends FeelingButtonEvent {
  final int selectedIndex;

  const GetSelectedIndexEvent({
    required this.selectedIndex,
  });
}
