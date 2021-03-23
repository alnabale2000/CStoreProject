import 'package:cstore/languages/languages.dart';
import 'package:flutter/material.dart';

class SortSettings extends StatefulWidget {
  final Function function;
  final Color bigColor;
  final Color lightColor;

  SortSettings({this.function, this.bigColor, this.lightColor});

  @override
  _SortSettingsState createState() => _SortSettingsState();
}

class _SortSettingsState extends State<SortSettings> {
  String orderRule;
  bool boolean;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Languages.of(context).sortLabel,
              style: TextStyle(
                  color: widget.bigColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            color: widget.bigColor.withOpacity(0.5),
            height: 1,
            width: double.infinity,
          ),
          // GestureDetector(
          //   child: SortChoice(
          //     text: 'Newest',
          //   ),
          //   onTap: () {al
          //     setState(() {
          //       orderRule = 'time';
          //     });
          //     Navigator.pop(context);
          //   },
          // ),
          GestureDetector(
            child: SortChoice(
              text: Languages.of(context).sortChoice1,
              lightColor: widget.lightColor,
              bigColor: widget.bigColor,
            ),
            onTap: () {
              setState(() {
                widget.function('price', true);
              });

              Navigator.pop(context);
            },
          ),
          GestureDetector(
            child: SortChoice(
              text: Languages.of(context).sortChoice2,
              bigColor: widget.bigColor,
              lightColor: widget.lightColor,
            ),
            onTap: () {
              setState(() {
                widget.function('price', false);
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class SortChoice extends StatelessWidget {
  final String text;
  final Color bigColor;
  final Color lightColor;

  SortChoice({this.text, this.lightColor, this.bigColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFE0E0E0),
        border: Border.all(color: lightColor, width: 0.9),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 12, 1, 10),
        child: Text(
          text,
          style: TextStyle(
            color: bigColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
