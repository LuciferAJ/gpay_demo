import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpay_demo/helpers/constant.dart';
import 'package:gpay_demo/modules/transfer_homepage/bloc/amount_widget_bloc.dart';
import 'package:gpay_demo/modules/transfer_homepage/bloc/transfer_homepage_bloc.dart'
    as transfer_bloc;
import 'package:gpay_demo/modules/transfer_homepage/widgets/transfer_homepage_footer.dart';

class TransferHomepage extends StatelessWidget {
  const TransferHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Constants.appColors.appBackgroundColor,
        floatingActionButton: MediaQuery.of(context).viewInsets.bottom >= 100
            ? FloatingActionButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                tooltip: 'Done',
                backgroundColor: Constants.appColors.white,
                child: Icon(Icons.done,
                    color: Constants.appColors.appBackgroundColor),
              )
            : null,
        appBar: AppBar(
          backgroundColor: Constants.appColors.appBackgroundColor,
          elevation: 0,
          leading: IconButton(
              onPressed: Platform.isAndroid
                  ? () {
                      SystemNavigator.pop();
                    }
                  : () {},
              icon: const Icon(Icons.arrow_back)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        bottomNavigationBar: const TransferHomepageFooter(),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(Constants.urls.sender)),
                  Icon(Icons.chevron_right,
                      color: Constants.appColors.white.withOpacity(0.8),
                      size: 22),
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(Constants.urls.reciever)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Payment to Red Bus\n(redbus@axis)",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  color: Constants.appColors.white.withOpacity(0.9)),
            ),
            const SizedBox(height: 30),
            BlocBuilder<AmountWidgetBloc, AmountWidgetState>(
              builder: (context, state) {
                return Align(
                  alignment: const Alignment(0.07, 0.0),
                  child: SizedBox(
                    width: state.fieldWidth,
                    child: TextField(
                      autofocus: true,
                      onChanged: (amount) {
                        registerAmount(amount, context);
                      },
                      maxLength: 7,
                      style: TextStyle(
                          fontSize: 50,
                          color: Constants.appColors.white,
                          fontWeight: FontWeight.w300),
                      cursorColor: Constants.appColors.white.withOpacity(0.54),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        prefixIconConstraints:
                            const BoxConstraints(maxWidth: 25, minWidth: 20),
                        prefixIcon: Center(
                          child: Text(
                            "₹",
                            style: TextStyle(
                                color: Constants.appColors.white, fontSize: 18),
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: '0',
                        counterText: "",
                        hintStyle: TextStyle(
                            fontSize: 45,
                            color: Constants.appColors.white.withOpacity(0.3)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                );
              },
            ),
            Text(
              "Payment via Billdesk",
              style: TextStyle(
                  fontSize: 15,
                  color: Constants.appColors.white.withOpacity(0.9)),
            )
          ],
        ),
      ),
    );
  }

  void registerAmount(String amount, BuildContext context) {
    final AmountWidgetBloc amountWidgetBloc =
        BlocProvider.of<AmountWidgetBloc>(context);
    final transfer_bloc.TransferHomepageBloc transferHomepageBloc =
        BlocProvider.of<transfer_bloc.TransferHomepageBloc>(context);
    transferHomepageBloc.add(transfer_bloc.AmountEnteredEvent(amount, context));
    amountWidgetBloc.add(AmountEnteredEvent(amount));
  }
}
