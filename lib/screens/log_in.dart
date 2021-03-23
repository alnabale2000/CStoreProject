import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cstore/components/login&signup_switch.dart';
import 'package:cstore/components/round_pass_filed.dart';
import 'package:cstore/components/rounded_button.dart';
import 'package:cstore/components/inputfield.dart';
import 'package:cstore/languages/languages.dart';
import 'package:cstore/screens/ps_or_xbox.dart';
import 'package:cstore/components/loading.dart';
import 'package:cstore/screens/sign_up.dart';
import 'package:cstore/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class LogIn extends StatefulWidget {
  final String verifyText;
  final String emailFromSignUp;
  final String passFromSignUp;
  final bool boolean;

  LogIn({
    this.verifyText,
    this.emailFromSignUp,
    this.passFromSignUp,
    this.boolean = false,
  });

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  String email = '';
  String pass = '';
  String error = '';
  bool loading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User logedInUser;
  String uid;
  String isVerified = '';

  void getVerify(dynamic result) async {
    try {
      final user = _auth.currentUser;
      if (user != null) logedInUser = user;
      uid = logedInUser.uid;
      var userData =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      setState(() {
        isVerified = userData.data()['verify'] ?? 'false';
      });

      print('IN LOOOGED INNNN $isVerified}');

      result != null && isVerified == 'true'
          ? Navigator.push(
              context, MaterialPageRoute(builder: (context) => PsOrXBox()))
          : setState(() {
              error = Languages.of(context).logError;
              loading = false;
            });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            body: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 130),
                      Text(
                        Languages.of(context).upperLogin,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kNeturalBigColor,
                          fontSize: 25,
                        ),
                      ),
                      Padding(
                        padding: widget.verifyText == ''
                            ? const EdgeInsets.all(0)
                            : const EdgeInsets.fromLTRB(10, 30, 10, 0),
                        child: Text(
                          widget.verifyText ?? '',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: widget.verifyText == '' ? 0 : 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      RoundedInputField(
                        boolean: widget.boolean ?? false,
                        hintText: widget.emailFromSignUp ??
                            Languages.of(context).logEmailHint,
                        icon: Icons.person,
                        color: kNeturalBigColor,
                        onChanged: (val) {
                          setState(() {
                            if (widget.emailFromSignUp != null)
                              val = widget.emailFromSignUp;

                            email = val;
                          });
                        },
                        validator: (String val) => widget.boolean
                            ? val.isEmpty
                                ? null
                                : ''
                            : val.isEmpty
                                ? Languages.of(context).logEmailError
                                : null,
                      ),
                      RoundedPasswordField(
                        boolean: widget.boolean ?? false,
                        hintText: widget.boolean
                            ? '********'
                            : Languages.of(context).logPassHint,
                        onChanged: (val) {
                          setState(() {
                            pass = val;
                          });
                        },
                        validator: (val) => val.length < 6 && !widget.boolean
                            ? Languages.of(context).logPassError
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
                        text: Languages.of(context).upperLogin,
                        press: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result =
                                await _authService.signInWithEmailAndPassword(
                                    widget.emailFromSignUp ?? email.trim(),
                                    widget.passFromSignUp ?? pass);
                            setState(() {
                              getVerify(result);
                            });
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
