import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'amount_widget_event.dart';
part 'amount_widget_state.dart';

class AmountWidgetBloc extends Bloc<AmountWidgetEvent, AmountWidgetState> {
  AmountWidgetBloc() : super(AmountWidgetInitial(fieldWidth: 100.0)) {
    on<AmountEnteredEvent>((event, emit) {
      final textFieldLength = (event.amount ?? "").length;
      const double singleFieldWidth = 100;
      double totalWidth = singleFieldWidth;
      if (textFieldLength > 1) {
        totalWidth += (28 * (textFieldLength - 1)).toDouble();
      }
      emit(AmountWidgetInitial(fieldWidth: totalWidth));
    });
    on<AmountResetEvent>((event, emit) => AmountWidgetInitial(fieldWidth: 100));
  }
}
