import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpay_demo/modules/upi_authentication/bloc/custom_keyboard_bloc.dart';
import 'package:gpay_demo/modules/upi_authentication/bloc/upi_pin_bloc.dart';
import 'package:gpay_demo/modules/upi_authentication/ui/upi_pin_view.dart';

part 'transfer_homepage_event.dart';
part 'transfer_homepage_state.dart';

class TransferHomepageBloc
    extends Bloc<TransferHomepageEvent, TransferHomepageState> {
  TransferHomepageBloc()
      : super(const TransferHomepagePrimaryButtonState(onPressed: null)) {
    on<AmountEnteredEvent>((event, emit) {
      final double? parsedAmount = double.tryParse(event.amount ?? "");

      // Navigate to Upi Pin screen if amount > 0
      if (parsedAmount != null && parsedAmount > 0) {
        emit(TransferHomepagePrimaryButtonState(onPressed: () {
          Navigator.push(
              event.context!,
              MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(providers: [
                        BlocProvider(create: (context) => CustomKeyboardBloc()),
                        BlocProvider(create: (context) {
                          return UpiPinBloc(context, parsedAmount);
                        }),
                      ], child: const UpiPinView())));
        }));
      } else {
        emit(const TransferHomepagePrimaryButtonState(onPressed: null));
      }
    });
    on<AmountResetEvent>((event, emit) =>
        const TransferHomepagePrimaryButtonState(onPressed: null));
  }
}
