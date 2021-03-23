import 'package:cstore/components/round_pass_filed.dart';
import 'package:cstore/components/rounded_button.dart';
import 'package:cstore/components/inputfield.dart';
import 'package:cstore/screens/sign_up.dart';
import 'package:cstore/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  String email = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100),
                Text(
                  "LOGIN",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kNeturalBigColor,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 100),
                RoundedInputField(
                  hintText: "Your Email",
                  color: kNeturalBigColor,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                ),
                RoundedPasswordField(
                  onChanged: (val) {
                    setState(() {
                      pass = val;
                    });
                  },
                  validator: (val) => val.length < 6 ? 'Wrong Password ' : null,
                ),
                RoundedButton(
                  text: "LOGIN",
                  press: () async {
                    if (_formKey.currentState.validate()) {
                      print('all good');
                      dynamic result = await _authService
                          .signInWithEmailAndPassword(email.trim(), pass);
                      print(email.trim());
                      print(pass);

                      if (result == null) print('Error');
                    }
                  },
                  color: kNeturalBigColor,
                ),
                SizedBox(height: 20),
                AlreadyHaveAnAccountCheck(
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
      ),
    );
  }
}

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
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: TextStyle(color: kNeturalBigColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
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
