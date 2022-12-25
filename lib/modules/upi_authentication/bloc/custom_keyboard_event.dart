part of 'custom_keyboard_bloc.dart';

abstract class CustomKeyboardEvent extends Equatable {
  const CustomKeyboardEvent();

  @override
  List<Object> get props => [];
}

class DigitEvent extends CustomKeyboardEvent {
  final String digit;
  final BuildContext? context;
  const DigitEvent(this.digit, this.context);

  @override
  List<Object> get props => [digit, context!];
}

class ActionEvent extends CustomKeyboardEvent {
  final String action;
  final BuildContext? context;
  const ActionEvent(this.action, this.context);

  @override
  List<Object> get props => [action, context!];
}
