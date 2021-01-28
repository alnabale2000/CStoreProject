import 'package:cstore/components/choose_card.dart';
import 'package:cstore/screens/ps3page.dart';
import 'package:cstore/screens/ps4page.dart';
import 'package:cstore/screens/ps5page.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class PsChoosePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD4D2E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB6B0E3),
        title: Text('Which one?'),
      ),
      body: Column(
        children: <Widget>[
          ChooseCard(
            text: 'PS5',
            color: kPsBigColor,
            function: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Ps5Store(),
                  ));
            },
          ),
          ChooseCard(
            text: 'PS4',
            color: kPsBigColor,
            function: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Ps4Store(),
                  ));
            },
          ),
          ChooseCard(
            text: 'PS3',
            color: kPsBigColor,
            function: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Ps3Store(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
