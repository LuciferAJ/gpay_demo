import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpay_demo/helpers/constant.dart';
import 'package:gpay_demo/modules/transfer_homepage/bloc/amount_widget_bloc.dart';
import 'package:gpay_demo/modules/transfer_homepage/ui/transfer_homepage_screen.dart';
import 'package:gpay_demo/modules/transfer_homepage/bloc/transfer_homepage_bloc.dart'
    as transfer_bloc;

class TranferAcknowledgementScreen extends StatefulWidget {
  final double amount;
  const TranferAcknowledgementScreen({
    required this.amount,
    Key? key,
  }) : super(key: key);

  @override
  State<TranferAcknowledgementScreen> createState() =>
      _TranferAcknowledgementScreenState();
}

class _TranferAcknowledgementScreenState
    extends State<TranferAcknowledgementScreen> with TickerProviderStateMixin {
  late AnimationController scaleController = AnimationController(
      duration: const Duration(milliseconds: 800), vsync: this);
  late Animation<double> scaleAnimation =
      CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
  late AnimationController checkController = AnimationController(
      duration: const Duration(milliseconds: 400), vsync: this);
  late Animation<double> checkAnimation =
      CurvedAnimation(parent: checkController, curve: Curves.linear);
  @override
  void initState() {
    super.initState();
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController.forward();
      }
    });
    scaleController.forward();
  }

  @override
  void dispose() {
    scaleController.dispose();
    checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double circleSize = 140;
    double iconSize = 108;

    return Scaffold(
      backgroundColor: Constants.appColors.appBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: ScaleTransition(
                  scale: scaleAnimation,
                  child: Container(
                    height: circleSize,
                    width: circleSize,
                    decoration: BoxDecoration(
                      color: Constants.appColors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Center(
                child: SizeTransition(
                  sizeFactor: checkAnimation,
                  axis: Axis.horizontal,
                  child: Center(
                    child: Icon(Icons.check_rounded,
                        color: Constants.appColors.appBackgroundColor,
                        size: iconSize),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Text(
            "₹ ${widget.amount.toStringAsFixed(2)} paid",
            style: TextStyle(color: Constants.appColors.white, fontSize: 30),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Redbus Pharma",
            style: TextStyle(
                color: Constants.appColors.white.withOpacity(0.9),
                fontSize: 16),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "redbus@axis",
            style: TextStyle(
                color: Constants.appColors.white.withOpacity(0.6),
                fontSize: 16),
          ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: () {
              try {
                final AmountWidgetBloc amountWidgetBloc =
                    BlocProvider.of<AmountWidgetBloc>(context);
                final transfer_bloc.TransferHomepageBloc transferHomepageBloc =
                    BlocProvider.of<transfer_bloc.TransferHomepageBloc>(
                        context);
                transferHomepageBloc.add(transfer_bloc.AmountResetEvent());
                amountWidgetBloc.add(AmountResetEvent());
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const TransferHomepage()),
                    (route) => false);
              } catch (e) {
                log(e.toString());
              }
            },
            style: ElevatedButton.styleFrom(
                primary: Constants.appColors.primaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Done",
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
