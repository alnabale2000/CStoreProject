import 'package:cstore/components/rounded_button.dart';
import 'package:cstore/languages/languages.dart';
import 'package:cstore/screens/log_in.dart';
import 'package:cstore/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class WelcomePage extends StatelessWidget {
  static final colorTween =
      ColorTween(begin: Colors.white, end: kNeturalLightColor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TweenAnimationBuilder(
                duration: Duration(seconds: 2),
                tween: colorTween,
                curve: Curves.bounceOut,

                builder: (_, Color color, __) {
                  return Text(
                    'ConsoleStore',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                      fontSize: 27.5,
                    ),
                  );
                },

                // 'ConsoleStore',
                // style: TextStyle(
                //   fontWeight: FontWeight.bold,
                //   color: kNeturalBigColor,
                //   fontSize: 27.5,
                // ),
              ),
              SizedBox(height: 30),
              Container(
                width: 410,
                child: Image.asset(
                  'images/wlecomePage.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 20),
              RoundedButton(
                color: kNeturalBigColor,
                text: Languages.of(context).upperLogin,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LogIn();
                      },
                    ),
                  );
                },
              ),
              RoundedButton(
                text: Languages.of(context).upperSignUp,
                color: Colors.grey[300],
                textColor: kNeturalBigColor,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUp();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
