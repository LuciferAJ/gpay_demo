part of 'upi_pin_bloc.dart';

abstract class UpiPinState extends Equatable {
  final List<int?> pin;
  final DateTime updatedAt;
  final double amount;
  const UpiPinState(this.pin, this.updatedAt,this.amount);
  @override
  List<Object> get props => [pin, updatedAt];
}

class UpiPinHidden extends UpiPinState {
  UpiPinHidden(List<int?> pin,double amount) : super(pin, DateTime.now(),amount);
}

class UpiPinVisible extends UpiPinState {
  UpiPinVisible(List<int?> pin,double amount) : super(pin, DateTime.now(),amount);
}
