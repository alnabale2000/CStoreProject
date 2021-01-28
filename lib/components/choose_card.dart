import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class ChooseCard extends StatelessWidget {
  final String text;
  final Color color;
  final Function function;

  ChooseCard({this.text, this.color, this.function});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 5.5, 18, 5.5),
        child: GestureDetector(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: color,
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  offset: Offset(0, 7),
                  blurRadius: 5.5,
                  spreadRadius: -5,
                ),
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: kBrandName,
              ),
            ),
          ),
          onTap: function,
        ),
      ),
    );
  }
}
