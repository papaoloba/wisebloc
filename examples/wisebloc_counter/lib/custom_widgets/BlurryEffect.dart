import 'package:flutter/material.dart';

import 'dart:ui';


class BlurryEffect extends StatelessWidget {
  final double blurry;

  BlurryEffect(this.blurry);
                                                                           
    @override  Widget build(BuildContext context) {
    return Positioned.fill(
          child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: blurry, sigmaY: blurry),
                    child: Container(            
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
                ),
    );
  }
}