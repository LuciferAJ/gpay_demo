import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpay_demo/helpers/constant.dart';
import 'package:gpay_demo/modules/upi_authentication/bloc/custom_keyboard_bloc.dart';

class CustomKeyboard extends StatelessWidget {
  const CustomKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      color: Constants.appColors.offWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: const [
              _NumberButton(number: "1"),
              _NumberButton(number: "2"),
              _NumberButton(number: "3"),
            ],
          ),
          Row(
            children: const [
              _NumberButton(number: "4"),
              _NumberButton(number: "5"),
              _NumberButton(number: "6"),
            ],
          ),
          Row(
            children: const [
              _NumberButton(number: "7"),
              _NumberButton(number: "8"),
              _NumberButton(number: "9"),
            ],
          ),
          Row(
            children: [
              _ActionButton(
                icon: Icons.backspace,
                onPressed: () {
                  final CustomKeyboardBloc customKeyboardBloc =
                      BlocProvider.of<CustomKeyboardBloc>(context);
                  customKeyboardBloc.add(ActionEvent("erase", context));
                },
              ),
              const _NumberButton(number: "0"),
              _ActionButton(
                icon: Icons.check_circle_rounded,
                iconSize: 45,
                onPressed: () {
                  final CustomKeyboardBloc customKeyboardBloc =
                      BlocProvider.of<CustomKeyboardBloc>(context);
                  customKeyboardBloc.add(ActionEvent("submit", context));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

abstract class _CustomButton extends StatelessWidget {
  final dynamic symbol;
  const _CustomButton({required this.symbol});
}

class _NumberButton extends _CustomButton {
  final String number;
  const _NumberButton({required this.number}) : super(symbol: number);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Constants.appColors.offWhite,
        child: TextButton(
          onPressed: () {
            final CustomKeyboardBloc customKeyboardBloc =
                BlocProvider.of<CustomKeyboardBloc>(context);
            customKeyboardBloc.add(DigitEvent(number, context));
          },
          child: Text(
            number,
            style: TextStyle(
                color: Constants.appColors.primaryColor, fontSize: 40),
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends _CustomButton {
  final IconData icon;
  final VoidCallback? onPressed;
  final double iconSize;
  const _ActionButton(
      {required this.icon, required this.onPressed, this.iconSize = 30})
      : super(symbol: icon);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Constants.appColors.offWhite,
        child: TextButton(
            onPressed: onPressed,
            child: SizedBox(
              height: 48,
              child: Icon(
                icon,
                size: iconSize,
                color: Constants.appColors.primaryColor,
              ),
            )),
      ),
    );
  }
}
