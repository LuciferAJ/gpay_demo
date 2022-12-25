import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gpay_demo/modules/transfer_homepage/bloc/amount_widget_bloc.dart';
import 'package:gpay_demo/modules/transfer_homepage/bloc/transfer_homepage_bloc.dart';
import 'package:gpay_demo/modules/transfer_homepage/ui/transfer_homepage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AmountWidgetBloc>(
          create: (BuildContext context) => AmountWidgetBloc(),
        ),
        BlocProvider<TransferHomepageBloc>(
          create: (BuildContext context) => TransferHomepageBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TransferHomepage(),
      ),
    );
  }
}
