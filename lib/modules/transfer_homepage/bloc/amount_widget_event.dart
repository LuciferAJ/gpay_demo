part of 'amount_widget_bloc.dart';

@immutable
abstract class AmountWidgetEvent extends Equatable {
  const AmountWidgetEvent();
}

class AmountEnteredEvent extends AmountWidgetEvent {
  final String? amount;
  const AmountEnteredEvent(this.amount);

  @override
  List<Object?> get props => [amount];
}

class AmountResetEvent extends AmountWidgetEvent {
  @override
  List<Object?> get props => [];
}
