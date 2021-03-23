import 'package:cstore/languages/languages.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login
              ? Languages.of(context).logSwitch
              : Languages.of(context).signSwitch,
          style: TextStyle(color: kNeturalBigColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login
                ? Languages.of(context).lowerSignUp
                : Languages.of(context).lowerLogin,
            style: TextStyle(
              color: kNeturalBigColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
