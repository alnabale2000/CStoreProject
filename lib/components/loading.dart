import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cstore/constant.dart';

class Loading extends StatelessWidget {
  final String text;

  Loading({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SpinKitFadingCube(
            duration: Duration(seconds: 2),
            color: kNeturalBigColor.withOpacity(0.7),
            size: 50,
          ),
        ),
      ),
    );
  }
}
