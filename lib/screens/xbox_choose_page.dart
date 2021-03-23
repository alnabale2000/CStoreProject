import 'package:cstore/components/choose_card.dart';
import 'package:cstore/screens/xbox3.dart';
import 'package:cstore/screens/xbox4.dart';
import 'package:cstore/screens/xbox5.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class XboxChoosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFB0E3B4),
          elevation: 0,
        ),
        backgroundColor: const Color(0xFFB0E3B4),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 55),
          child: Column(
            children: <Widget>[
              ChooseCard(
                text: 'XBOX Series X',
                color: kXboxBigColor,
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => XBox5Store(),
                      ));
                },
              ),
              ChooseCard(
                text: 'XBOX ONE',
                color: kXboxBigColor,
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => XBox4Store(),
                      ));
                },
              ),
              ChooseCard(
                text: 'XBOX 360',
                color: kXboxBigColor,
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => XBox3Store(),
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
