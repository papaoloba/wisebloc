import 'package:flutter/material.dart';
import 'package:wisebloc_counter/custom_widgets/BlurryEffect.dart';

class StandardLoadingScreen extends StatelessWidget {
  const StandardLoadingScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
        body: Center(
          child: Container(child: Container()),
        ),
      ),
      BlurryEffect(5),
      Center(
          child: Container(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(),
      ))
    ]);
  }
}
