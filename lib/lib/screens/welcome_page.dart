import 'package:cstore/components/rounded_button.dart';
import 'package:cstore/screens/log_in.dart';
import 'package:cstore/screens/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class WelcomePage extends StatelessWidget {
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
              Text(
                "Welcome To ConsStore",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kNeturalBigColor,
                    fontSize: 20),
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
                text: "LOGIN",
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
                text: "SIGN UP",
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
