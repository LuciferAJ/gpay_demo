import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpay_demo/helpers/constant.dart';
import 'package:gpay_demo/modules/transfer_homepage/bloc/transfer_homepage_bloc.dart';

class TransferHomepageFooter extends StatelessWidget {
  const TransferHomepageFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.all(20.0),
      height: size.height * 0.2,
      constraints: const BoxConstraints(maxHeight: 250),
      decoration: BoxDecoration(
        color: Constants.appColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 23,
                width: 38,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(3)),
                child: Icon(Icons.stop_circle_rounded,
                    color: Constants.appColors.white, size: 18),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Your Bank •••• 4321",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              const Spacer(),
              const Icon(Icons.expand_more)
            ],
          ),
          const Spacer(),
          BlocBuilder<TransferHomepageBloc, TransferHomepageState>(
            builder: (context, state) {
              return ElevatedButton(
                onPressed: state.onPressed,
                style: ElevatedButton.styleFrom(
                    primary: Constants.appColors.appBackgroundColor,
                    elevation: 0.0,
                    fixedSize: Size(size.width, 50),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)))),
                child: const Text(
                  'Proceed to pay',
                  style: TextStyle(fontSize: 16),
                ),
              );
            },
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "IN PARTNERSHIP WITH YOUR BANK",
            style: TextStyle(
                fontSize: 9,
                color: Colors.black54,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
