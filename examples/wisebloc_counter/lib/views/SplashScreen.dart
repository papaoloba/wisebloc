import 'package:flutter/material.dart';
import 'package:wisebloc_counter/custom_widgets/BlurryEffect.dart';

// This screen is a default screen (all apps must have a splash screen)

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
        body: Center(
          child: Container(
            color: Colors.white,
            child: Container()),
        ),
      ),
      BlurryEffect(5),
      Center(
          child: Container(
        width: 100,
        height: 100,
        child: CircularProgressIndicator(),
      ))
    ]);
  }
}