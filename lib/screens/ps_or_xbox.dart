import 'package:cstore/screens/ps_choose_page.dart';
import 'package:cstore/screens/xbox_choose_page.dart';
import 'package:cstore/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class PsOrXBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPsOrXboxColor,
        body: Column(
          children: <Widget>[
            POrXContainer(
              color: kPsBigColor,
              text: 'PS',
              shadow: BoxShadow(
                color: Color(0xFF00439C),
                offset: Offset(0, 7),
                blurRadius: 5,
                spreadRadius: -5.5,
              ),
              function: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PsChoosePage(),
                    ));
              },
            ),
            POrXContainer(
              color: kXboxBigColor,
              text: 'xbox',
              shadow: BoxShadow(
                color: Color(0xFF083800),
                offset: Offset(0, 7),
                blurRadius: 5,
                spreadRadius: -5.5,
              ),
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => XboxChoosePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class POrXContainer extends StatelessWidget {
  final Color color;

  final String text;
  final Function function;
  final BoxShadow shadow;

  POrXContainer({this.color, this.text, this.function, this.shadow});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(7),
        child: GestureDetector(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: color,
              boxShadow: [shadow],
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(text, style: kBrandName),
                  Text(
                    'STORE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 69,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: function,
        ),
      ),
    );
  }
}
