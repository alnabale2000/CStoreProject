import 'package:cstore/components/inputfield.dart';
import 'package:cstore/components/loading.dart';
import 'package:cstore/components/login&signup_switch.dart';
import 'package:cstore/components/round_pass_filed.dart';
import 'package:cstore/components/rounded_button.dart';
import 'package:cstore/languages/languages.dart';
import 'package:cstore/screens/log_in.dart';
import 'package:cstore/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class SignUp extends StatefulWidget {
  final bool boolean;

  SignUp({this.boolean = false});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authService = AuthService();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String username = '';
  String email = '';
  String pass = '';
  String phoneNumber = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 80),
                    Text(
                      Languages.of(context).upperSignUp,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: kNeturalBigColor,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(height: 30),
                    RoundedInputField(
                      color: kNeturalBigColor,
                      hintText: Languages.of(context).signUserHint,
                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                      icon: Icons.person,
                      validator: (String val) => val.isEmpty
                          ? Languages.of(context).signUserError
                          : null,
                    ),
                    RoundedInputField(
                      color: kNeturalBigColor,
                      hintText: Languages.of(context).signEmailHint,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      icon: Icons.email,
                      validator: (String val) => val.isEmpty
                          ? Languages.of(context).signEmailError
                          : null,
                    ),
                    RoundedPasswordField(
                      hintText: Languages.of(context).logPassHint,
                      onChanged: (value) {
                        setState(() {
                          pass = value;
                        });
                      },
                      validator: (String val) => val.length < 6
                          ? Languages.of(context).signPassError
                          : null,
                    ),
                    RoundedInputField(
                      color: kNeturalBigColor,
                      onChanged: (value) {
                        phoneNumber = value;
                      },
                      isNumber: true,
                      hintText: Languages.of(context).signPhoneHint,
                      icon: Icons.phone,
                      validator: (String val) =>
                          val.contains(RegExp('[a-zA-Z]'), 0) ||
                                  val.length != 10
                              ? Languages.of(context).signPhoneError
                              : null,
                    ),
                    Padding(
                      padding: error == ''
                          ? const EdgeInsets.all(0)
                          : const EdgeInsets.all(8.0),
                      child: Text(
                        error ?? '',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: error == '' ? 0 : 20,
                        ),
                      ),
                    ),
                    RoundedButton(
                      text: Languages.of(context).upperSignUp,
                      press: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result =
                              await _authService.regWithEmailAndPass(
                                  email.trim(), pass, username, phoneNumber);
                          if (result != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LogIn(
                                  emailFromSignUp: email.trim(),
                                  passFromSignUp: pass,
                                  boolean: true,
                                  verifyText: Languages.of(context).verify,
                                ),
                              ),
                            );
                          } else {
                            setState(() {
                              error = Languages.of(context).signError;
                              loading = false;
                            });
                          }
                        }
                      },
                      color: kNeturalBigColor,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AlreadyHaveAnAccountCheck(
                      login: false,
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
                    SizedBox(height: 30)
                  ],
                ),
              ),
            ),
          );
  }
}
