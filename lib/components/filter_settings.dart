import 'package:cstore/languages/languages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class FilterSettings extends StatefulWidget {
  final Function function;
  final Color bigColor;
  final Color lightColor;

  FilterSettings({this.function, this.bigColor, this.lightColor});

  @override
  _FilterSettingsState createState() => _FilterSettingsState();
}

class _FilterSettingsState extends State<FilterSettings> {
  double _starValue = 1;
  double _endValue = 999;
  double minValue = 1;
  double maxValue = 999;

  final startController = TextEditingController();
  final endController = TextEditingController();

  String sOrB;
  String uOrN;

  @override
  void initState() {
    super.initState();

    startController.addListener(_setStartValue);
    endController.addListener(_setEndValue);
  }

  @override
  void dispose() {
    startController.dispose();
    endController.dispose();
    super.dispose();
  }

  _setStartValue() {
    if (double.parse(startController.text).roundToDouble() <=
            double.parse(endController.text).roundToDouble() &&
        double.parse(startController.text).roundToDouble() >= minValue &&
        double.parse(endController.text).roundToDouble() >= minValue &&
        double.parse(startController.text).roundToDouble() <= maxValue &&
        double.parse(endController.text).roundToDouble() <= maxValue) {
      setState(() {
        _starValue = double.parse(startController.text).roundToDouble();
      });
    }
  }

  _setEndValue() {
    if (double.parse(startController.text).roundToDouble() <=
            double.parse(endController.text).roundToDouble() &&
        double.parse(startController.text).roundToDouble() >= minValue &&
        double.parse(endController.text).roundToDouble() >= minValue &&
        double.parse(startController.text).roundToDouble() <= maxValue &&
        double.parse(endController.text).roundToDouble() <= maxValue) {
      setState(() {
        _endValue = double.parse(endController.text).roundToDouble();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 600,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                Languages.of(context).filter,
                style: TextStyle(
                  color: widget.bigColor,
                  fontSize: 35,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kFilterContainerColor, width: 2),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 6.5),
                          child: Text(
                            Languages.of(context).price,
                            style:
                                TextStyle(color: widget.bigColor, fontSize: 25),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 6.5),
                          child: Text(
                            Languages.of(context).filterUnit,
                            style:
                                TextStyle(color: widget.bigColor, fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: kFilterContainerColor,
                    ),
                    StatefulBuilder(
                      builder: (BuildContext context,
                          void Function(void Function()) setState) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 1.5,
                            ),
                            child: RangeSlider(
                              activeColor: widget.bigColor,
                              inactiveColor: Color(0xFFA3DDFF),
                              min: minValue,
                              max: maxValue,
                              values: RangeValues(_starValue, _endValue),
                              onChanged: (values) {
                                setState(() {
                                  _starValue = values.start.roundToDouble();
                                  _endValue = values.end.roundToDouble();
                                  startController.text =
                                      values.start.roundToDouble().toString();
                                  endController.text =
                                      values.end.roundToDouble().toString();
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          PriceTextField(
                            controller: startController,
                            hintText: Languages.of(context).filterTextField1,
                            color: widget.bigColor,
                          ),
                          Spacer(),
                          PriceTextField(
                            controller: endController,
                            hintText: Languages.of(context).filterTextField2,
                            color: widget.bigColor,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: kFilterContainerColor, width: 2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 6.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Languages.of(context).condition,
                            style:
                                TextStyle(color: widget.bigColor, fontSize: 25),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: kFilterContainerColor,
                    ),
                    SizedBox(height: 3),
                    StatefulBuilder(
                      builder: (BuildContext context,
                          void Function(void Function()) setState) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // right = false;
                                    // left = true;
                                    sOrB = 'Buy';
                                  });
                                },
                                child: Container(
                                  width: 170,
                                  height: 58,
                                  decoration: BoxDecoration(
                                    color: sOrB == 'Buy'
                                        ? widget.bigColor
                                        : Colors.grey[200],
                                    borderRadius: !Languages.of(context)
                                            .isArabic
                                        ? BorderRadius.only(
                                            bottomLeft: Radius.circular(30),
                                            topLeft: Radius.circular(30),
                                          )
                                        : BorderRadius.only(
                                            bottomRight: Radius.circular(30),
                                            topRight: Radius.circular(30),
                                          ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      Languages.of(context).buy,
                                      style: sOrB == 'Buy'
                                          ? kTopButtonStyleEnable
                                          : kTopButtonStyleEnable.copyWith(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w300,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 3),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // left = false;
                                    // right = true;
                                    sOrB = 'Sell';
                                  });
                                },
                                child: Container(
                                  width: 170,
                                  height: 58,
                                  decoration: BoxDecoration(
                                    color: sOrB == 'Sell'
                                        ? widget.bigColor
                                        : Colors.grey[200],
                                    borderRadius: Languages.of(context).isArabic
                                        ? BorderRadius.only(
                                            bottomLeft: Radius.circular(30),
                                            topLeft: Radius.circular(30),
                                          )
                                        : BorderRadius.only(
                                            bottomRight: Radius.circular(30),
                                            topRight: Radius.circular(30),
                                          ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      Languages.of(context).sell,
                                      style: sOrB == 'Sell'
                                          ? kTopButtonStyleEnable
                                          : kTopButtonStyleEnable.copyWith(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 3),
                    StatefulBuilder(
                      builder: (BuildContext context,
                          void Function(void Function()) setState) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // right = false;
                                  // left = true;
                                  uOrN = 'Used';
                                });
                              },
                              child: Container(
                                width: 170,
                                height: 58,
                                decoration: BoxDecoration(
                                  color: uOrN == 'Used'
                                      ? widget.bigColor
                                      : Colors.grey[200],
                                  borderRadius: !Languages.of(context).isArabic
                                      ? BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                        )
                                      : BorderRadius.only(
                                          bottomRight: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                ),
                                child: Center(
                                  child: Text(
                                    Languages.of(context).used,
                                    style: uOrN == 'Used'
                                        ? kTopButtonStyleEnable
                                        : kTopButtonStyleEnable.copyWith(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 3),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // left = false;
                                  // right = true;
                                  uOrN = 'New';
                                });
                              },
                              child: Container(
                                width: 170,
                                height: 58,
                                decoration: BoxDecoration(
                                  color: uOrN == 'New'
                                      ? widget.bigColor
                                      : Colors.grey[200],
                                  borderRadius: Languages.of(context).isArabic
                                      ? BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          topLeft: Radius.circular(30),
                                        )
                                      : BorderRadius.only(
                                          bottomRight: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                ),
                                child: Center(
                                  child: Text(
                                    Languages.of(context).new1,
                                    style: uOrN == 'New'
                                        ? kTopButtonStyleEnable
                                        : kTopButtonStyleEnable.copyWith(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 3),
                    SizedBox(height: 9),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            FlatButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context,
                      widget.function(sOrB, uOrN, _starValue, _endValue));
                });
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 3.5),
                      spreadRadius: -4,
                      blurRadius: 4.5,
                      color: kPsLightColor,
                    )
                  ],
                  color: widget.bigColor,
                ),
                child: Center(
                  child: Text(
                    Languages.of(context).filterButton,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      letterSpacing: 0.7,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PriceTextField extends StatelessWidget {
  const PriceTextField(
      {Key key, @required this.controller, this.hintText, this.color})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        color: Color(0xFFEBEBEB),
        width: 140,
        height: 50,
        child: TextField(
          style: TextStyle(color: color, fontSize: 19),
          cursorColor: kPsLightColor,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: EdgeInsets.all(10),
          ),
          controller: controller,
        ),
      ),
    );
  }
}
