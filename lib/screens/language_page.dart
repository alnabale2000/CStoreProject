import 'package:cstore/languages/language_data.dart';
import 'package:cstore/languages/languages.dart';
import 'package:cstore/locale_constant.dart';
import 'package:cstore/screens/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cstore/constant.dart';

class LanguagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LanguagePageState();
}

class LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNeturalLightColor,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: kNeturalLightColor,
        leading: Icon(
          Icons.language,
          color: Colors.white,
        ),
        //title: Text(Languages.of(context).languageAppBar),
        title: Text(Languages.of(context).languageAppBar),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[700],
                  blurRadius: 11,
                  spreadRadius: -2,
                  offset: Offset(0, 5),
                )
              ]),
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                Languages.of(context).languageWelcome,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              _createLanguageDropDown(),
              SizedBox(height: 27.5),
              RaisedButton(
                elevation: 7.5,
                color: kNeturalLightColor,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                },
                child: Text(Languages.of(context).languageButton),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _createLanguageDropDown() {
    return DropdownButton<LanguageData>(
      iconSize: 30,
      hint: Text(Languages.of(context).selectLanguage),
      onChanged: (LanguageData language) {
        changeLanguage(context, language.languageCode);
      },
      items: LanguageData.languageList()
          .map<DropdownMenuItem<LanguageData>>(
            (e) => DropdownMenuItem<LanguageData>(
              value: e,
              child: Text(e.name),
            ),
          )
          .toList(),
    );
  }
}
