import 'dart:io';
import 'package:cstore/components/ad_page_fields.dart';
import 'package:cstore/components/rounded_button.dart';
import 'package:cstore/languages/languages.dart';
import 'package:cstore/screens/ps3page.dart';
import 'package:cstore/screens/ps4page.dart';
import 'package:cstore/screens/ps5page.dart';
import 'package:cstore/screens/xbox3.dart';
import 'package:cstore/screens/xbox4.dart';
import 'package:cstore/screens/xbox5.dart';
import 'package:cstore/services/database.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'image_picker.dart';

class AddPage extends StatefulWidget {
  final File file;
  final String url;

  AddPage({this.file, this.url});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String title;
  String description;
  String neighborhood;
  String city;
  int price;
  String condition;
  String sOrb;
  String consoleType;
  String test;

  bool getValRange(String value) {
    int price = int.parse(value);
    if (price > 1000 || price < 0) return false;
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userr>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kNeturalBigColor,
        title: Text(Languages.of(context).addAppBar),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImageCapture(),
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      width: 150,
                      color: kNeturalBigColor.withOpacity(0.9),
                      child: Center(
                          child: Icon(
                        Icons.add_a_photo,
                        color: Colors.white70,
                        size: 50,
                      )),
                    ),
                  ),
                  widget.file != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(
                            widget.file,
                            height: 100,
                          ),
                        )
                      : Container(),
                ],
              ),
              SizedBox(height: 30),
              AdPageTextFiled(
                minLines: 1,
                maxLines: 2,
                icon: Icons.title,
                text: Languages.of(context).addTitleHint,
                validator: (val) =>
                    val.isEmpty ? Languages.of(context).addTitleError : null,
                onChanged: (val) {
                  setState(() {
                    title = val;
                  });
                },
              ),
              AdPageTextFiled(
                minLines: 1,
                isMultiLine: true,
                icon: Icons.description,
                text: Languages.of(context).addDescHint,
                onChanged: (val) {
                  setState(() {
                    description = val;
                  });
                },
              ),
              AdPageTextFiled(
                isNumber: true,
                minLines: 1,
                maxLines: 1,
                icon: Icons.attach_money,
                text: Languages.of(context).addPriceHint,
                validator: (val) => val.isEmpty
                    ? Languages.of(context).addPriceError
                    : getValRange(val)
                        ? null
                        : 'Range is 0-1000',
                onChanged: (val) {
                  setState(() {
                    price = int.parse(val);
                  });
                },
              ),
              SizedBox(height: 5),
              AdPageDropDown(
                dropDownValue: Languages.of(context).addCity,
                listContent: [
                  Languages.of(context).addCity,
                  Languages.of(context).amman,
                  Languages.of(context).alAqaba,
                  Languages.of(context).irbid,
                  Languages.of(context).jerash,
                  Languages.of(context).maan,
                  Languages.of(context).mafraq,
                  Languages.of(context).tafilah,
                  Languages.of(context).madaba,
                  Languages.of(context).karak,
                  Languages.of(context).ajloun,
                  Languages.of(context).zarqa,
                  Languages.of(context).alBalqa
                ],
                validator: (val) => val == Languages.of(context).addCity
                    ? Languages.of(context).addCityError
                    : null,
                onChanged: (val) {
                  setState(() {
                    if (val == 'عمان') val = 'Amman';
                    if (val == 'العقبة') val = 'Al-Aqaba';
                    if (val == 'اربد') val = 'Irbid';
                    if (val == 'جرش') val = 'Jerash';
                    if (val == 'معان') val = "Ma'an";
                    if (val == 'المفرق') val = 'Mafraq';
                    if (val == 'الطفيلة') val = 'At-Tafilah';
                    if (val == 'مأدبا') val = 'Madaba';
                    if (val == 'الكرك') val = 'Karak';
                    if (val == 'عجلون') val = 'Ajloun';
                    if (val == 'الزرقاء') val = 'Zarqa';
                    if (val == 'البلقاء') val = 'Al-Balqa';

                    city = val;
                  });
                },
              ),
              AdPageTextFiled(
                minLines: 1,
                maxLines: 1,
                icon: Icons.home,
                text: Languages.of(context).addNeighborhoodHint,
                onChanged: (val) {
                  setState(() {
                    neighborhood = val;
                  });
                },
              ),
              AdPageDropDown(
                dropDownValue: Languages.of(context).addCondition,
                listContent: [
                  Languages.of(context).addCondition,
                  Languages.of(context).used,
                  Languages.of(context).new1
                ],
                validator: (val) => val == Languages.of(context).addCondition
                    ? Languages.of(context).addConditionError
                    : null,
                onChanged: (val) {
                  setState(() {
                    if (val == 'مستعمل') val = 'Used';
                    if (val == 'جديد') val = 'New';
                    condition = val;
                  });
                },
              ),
              AdPageDropDown(
                dropDownValue: Languages.of(context).addSOrB,
                listContent: [
                  Languages.of(context).addSOrB,
                  Languages.of(context).sell,
                  Languages.of(context).buy
                ],
                validator: (val) => val == Languages.of(context).addSOrB
                    ? Languages.of(context).addSOrBError
                    : null,
                onChanged: (val) {
                  setState(() {
                    if (val == 'بيع') val = 'Buy';
                    if (val == 'شراء') val = 'Sell';

                    sOrb = val;
                  });
                },
              ),
              AdPageDropDown(
                dropDownValue: Languages.of(context).addType,
                listContent: [
                  Languages.of(context).addType,
                  'ps3',
                  'ps4',
                  'ps5',
                  'XBox360',
                  'XBoxOne',
                  'XBox Series X',
                ],
                validator: (val) => val == Languages.of(context).addType
                    ? Languages.of(context).addTypeError
                    : null,
                onChanged: (val) {
                  setState(() {
                    consoleType = val;
                  });
                },
              ),
              SizedBox(height: 30),
              RoundedButton(
                text: Languages.of(context).addButton,
                color: kNeturalBigColor,
                textColor: Colors.white,
                press: () async {
                  if (_formKey.currentState.validate()) {
                    await DataBaseService(uid: user.uid, type: consoleType)
                        .addPost(
                      title: title,
                      city: city,
                      condition: condition,
                      description: description,
                      neighborhood: neighborhood,
                      price: price,
                      sOrb: sOrb,
                      url: widget.url,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => consoleType == 'ps3'
                            ? Ps3Store()
                            : consoleType == 'ps4'
                                ? Ps4Store()
                                : consoleType == 'ps5'
                                    ? Ps5Store()
                                    : consoleType == 'XBox360'
                                        ? XBox3Store()
                                        : consoleType == 'XBoxOne'
                                            ? XBox4Store()
                                            : XBox5Store(),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
