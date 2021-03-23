import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cstore/screens/ps_or_xbox.dart';

import 'package:cstore/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/language_page.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
    getVerify();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User logedInUser;
  String uid;
  String isVerified = '';

  void getVerify() async {
    try {
      final user = _auth.currentUser;
      if (user != null) logedInUser = user;
      uid = logedInUser.uid;
      var userData =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      setState(() {
        isVerified = userData.data()['verify'];
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    print('IN THE WRAPPER $isVerified');
    final user = Provider.of<Userr>(context);
    return user != null && isVerified == 'true' ? PsOrXBox() : LanguagePage();
  }
}
