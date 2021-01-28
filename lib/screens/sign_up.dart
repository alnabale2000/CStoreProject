import 'package:cstore/components/inputfield.dart';
import 'package:cstore/components/round_pass_filed.dart';
import 'package:cstore/components/rounded_button.dart';
import 'package:cstore/screens/log_in.dart';
import 'package:cstore/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  String username = '';
  String email = '';
  String pass = '';
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),
              Text(
                "SIGNUP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kNeturalBigColor,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 50),
              RoundedInputField(
                color: kNeturalBigColor,
                hintText: 'Username',
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                icon: Icons.person,
                validator: (val) => val.isEmpty ? 'Enter Username' : null,
              ),
              RoundedInputField(
                color: kNeturalBigColor,
                hintText: 'Email',
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                icon: Icons.email,
                validator: (val) => val.isEmpty ? 'Enter an Email' : null,
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  setState(() {
                    pass = value;
                  });
                },
                validator: (val) =>
                    val.length < 6 ? 'Enter a Password +6 characters ' : null,
              ),
              RoundedInputField(
                hintText: 'Phone number',
                color: kNeturalBigColor,
                onChanged: (value) {
                  phoneNumber = value;
                },
                icon: Icons.phone,
                validator: (val) =>
                    val.length != 10 ? 'Wrong Phone number' : null,
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () async {
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _authService.regWithEmailAndPass(
                        email.trim(), pass, username, phoneNumber);
                    print('hello');
                    if (result == null) print('shit');
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
            ],
          ),
        ),
      ),
    );
  }
}
