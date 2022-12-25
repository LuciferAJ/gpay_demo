part of 'amount_widget_bloc.dart';

abstract class AmountWidgetState extends Equatable {
  final double fieldWidth;
  final DateTime updatedAt;
  const AmountWidgetState({required this.fieldWidth, required this.updatedAt});
  @override
  List<Object?> get props => [fieldWidth, updatedAt];
}

class AmountWidgetInitial extends AmountWidgetState {
  AmountWidgetInitial({required double fieldWidth})
      : super(fieldWidth: fieldWidth, updatedAt: DateTime.now());
}
