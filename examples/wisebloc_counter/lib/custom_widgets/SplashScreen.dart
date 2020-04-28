import 'package:flutter/material.dart';
import 'package:wisebloc_counter/bloc/app_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:after_layout/after_layout.dart';
import '../views/SplashScreen.dart';


class SplashScreenCaller extends StatefulWidget {
  const SplashScreenCaller({
    Key key,
  }) : super(key: key);

  @override
  _SplashScreenCallerState createState() => _SplashScreenCallerState();
}

class _SplashScreenCallerState extends State<SplashScreenCaller> with AfterLayoutMixin<SplashScreenCaller> {

  @override
  void afterFirstLayout(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2)); // TODO: uncomment this line (simulates delay)
    BlocProvider.of<AppBloc>(context).add(InitializeApp());
}

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
