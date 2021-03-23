import 'package:cstore/screens/ps_or_xbox.dart';
import 'package:cstore/screens/welcome_page.dart';
import 'package:cstore/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userr>(context);
    return user == null ? WelcomePage() : PsOrXBox();
  }
}
