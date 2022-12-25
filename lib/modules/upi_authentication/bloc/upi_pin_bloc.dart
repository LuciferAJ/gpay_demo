import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpay_demo/helpers/constant.dart';
import 'package:gpay_demo/modules/transfer_acknowledgment/ui/transfer_acknowledgment_screen.dart';
import 'package:gpay_demo/modules/upi_authentication/bloc/custom_keyboard_bloc.dart';

part 'upi_pin_event.dart';
part 'upi_pin_state.dart';

class UpiPinBloc extends Bloc<UpiPinEvent, UpiPinState> {
  final double amount;
  BuildContext context;
  final List<int?> pin =
      List.filled(Constants.pin.pinLength, null, growable: false);
  UpiPinBloc(this.context, this.amount)
      : super(UpiPinHidden(
            List.filled(Constants.pin.pinLength, null, growable: false),
            amount)) {
    on<ToggleUpiPinEvent>((event, emit) {
      // Toggle the visibilty of Entered Pin
      state is UpiPinHidden
          ? emit(UpiPinVisible(pin, amount))
          : emit(UpiPinHidden(pin, amount));
    });
    on<KeyboardInputEvent>((event, emit) {
      state is UpiPinHidden
          ? emit(UpiPinHidden(pin, amount))
          : emit(UpiPinVisible(pin, amount));
    });

// Listening for the custom keyboard events
    final CustomKeyboardBloc customKeyboardBloc =
        BlocProvider.of<CustomKeyboardBloc>(context);
    customKeyboardBloc.stream.listen((state) {
      // Differentiating if the events are Digits or Actions
      if (state is! EraseState && state is! SubmitState) {
        if (pin.contains(null)) {
          final pinIndex = pin.indexWhere((element) => element == null);
          pin[pinIndex] = int.parse(state.value);
          add(const KeyboardInputEvent());
        }
      } else if (state is EraseState) {
        final emptyPin = pin.firstWhere(
          (element) => element != null,
          orElse: () => null,
        );
        if (emptyPin != null) {
          final pinRemovalIndex =
              pin.lastIndexWhere((element) => element != null);
          pin[pinRemovalIndex] = null;
          add(const KeyboardInputEvent());
        }
      } else if (state is SubmitState) {
        // In case of Pin not completely entered, show error snackbar
        if (pin.contains(null)) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "Please enter ${Constants.pin.pinLength} digit UPI PIN",
              style: const TextStyle(color: Colors.red),
            ),
            backgroundColor: Constants.appColors.secondaryColor,
            action: SnackBarAction(
                label: "DISMISS",
                onPressed: () {},
                textColor: Constants.appColors.primaryColor),
          ));
        } else {
          // In case of successful pin entry navigate to Acknowledgment screen
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TranferAcknowledgementScreen(
                        amount: amount,
                      )));
        }
      }
    });
  }
}
