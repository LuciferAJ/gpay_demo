part of 'upi_pin_bloc.dart';

abstract class UpiPinEvent extends Equatable {
  const UpiPinEvent();
  @override
  List<Object> get props => [];
}

class ToggleUpiPinEvent extends UpiPinEvent {
  const ToggleUpiPinEvent();
}

class KeyboardInputEvent extends UpiPinEvent {
  const KeyboardInputEvent();
}
