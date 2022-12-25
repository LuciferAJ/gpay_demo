import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpay_demo/helpers/constant.dart';
import 'package:gpay_demo/modules/upi_authentication/bloc/custom_keyboard_bloc.dart';
import 'package:gpay_demo/modules/upi_authentication/bloc/upi_pin_bloc.dart';
import 'package:gpay_demo/modules/upi_authentication/widgets/custom_keyboard.dart';

class UpiPinView extends StatelessWidget {
  const UpiPinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.appColors.white,
      appBar: AppBar(
        backgroundColor: Constants.appColors.white,
        leading: const SizedBox(),
        leadingWidth: 0,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "ICICI Bank",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: 100,
              height: 70,
              child: Image.network(Constants.urls.upiLogo),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            color: Constants.appColors.primaryColor,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Verve Financial Services",
                    style: TextStyle(
                        color: Constants.appColors.white.withOpacity(0.9),
                        fontSize: 16),
                  ),
                ),
                BlocBuilder<UpiPinBloc, UpiPinState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "₹ ${state.amount.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Constants.appColors.white.withOpacity(0.9),
                            fontSize: 16),
                      ),
                    );
                  },
                ),
                Icon(
                  Icons.expand_more,
                  color: Constants.appColors.white,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomKeyboard(),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: SizedBox(
              width: size.width * 0.65,
              child: Row(
                children: [
                  Text(
                    "ENTER UPI PIN",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                  const Spacer(),
                  BlocBuilder<UpiPinBloc, UpiPinState>(
                      builder: (context, state) {
                    switch (state.runtimeType) {
                      case UpiPinVisible:
                        return TextButton.icon(
                            onPressed: () {
                              toggleUpiPin(context);
                            },
                            icon: Icon(Icons.visibility_off,
                                color: Constants.appColors.primaryColor),
                            label: Text(
                              "HIDE",
                              style: TextStyle(
                                  color: Constants.appColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ));

                      case UpiPinHidden:
                      default:
                        return TextButton.icon(
                            onPressed: () {
                              toggleUpiPin(context);
                            },
                            icon: Icon(Icons.visibility,
                                color: Constants.appColors.primaryColor),
                            label: Text(
                              "SHOW",
                              style: TextStyle(
                                  color: Constants.appColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ));
                    }
                  })
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              height: 50,
              child: BlocBuilder<UpiPinBloc, UpiPinState>(
                builder: (context, state) {
                  return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        switch (state.runtimeType) {
                          case UpiPinVisible:
                            return state.pin[index] != null
                                ? SizedBox(
                                    width: size.width * 0.12,
                                    child: Center(
                                      child: Text(
                                        "${state.pin[index]}",
                                        style: const TextStyle(
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))
                                : Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    width: size.width * 0.12,
                                    child: Divider(
                                      color: Constants.appColors.primaryColor,
                                      height: 0.0,
                                      thickness: 2.5,
                                    ),
                                  );
                          case UpiPinHidden:
                          default:
                            return state.pin[index] != null
                                ? SizedBox(
                                    width: size.width * 0.12,
                                    child: const Icon(
                                        Icons.fiber_manual_record_rounded))
                                : Container(
                                    width: size.width * 0.12,
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Divider(
                                      color: Constants.appColors.primaryColor,
                                      height: 0.0,
                                      thickness: 2.5,
                                    ),
                                  );
                        }
                      },
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 15,
                          ),
                      itemCount: Constants.pin.pinLength);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void toggleUpiPin(BuildContext context) {
    final UpiPinBloc upiPinBloc = BlocProvider.of<UpiPinBloc>(context);
    upiPinBloc.add(const ToggleUpiPinEvent());
  }
}
