import 'package:flutter/material.dart';

abstract class Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  bool get isArabic;

  String get lowerLogin;

  String get lowerSignUp;

  String get upperLogin;

  String get upperSignUp;

  String get sort;

  String get filter;

  String get verify;

  /// Start Language Page

  String get languageAppBar;

  String get languageWelcome;

  String get selectLanguage;

  String get languageButton;

  ///End Language Page

  ///Strat login

  String get logEmailHint;

  String get logPassHint;

  String get logSwitch;

  String get logEmailError;

  String get logPassError;

  String get logError;

  ///End Login

  ///Start SignUp

  String get signUserHint;

  String get signUserError;

  String get signEmailHint;

  String get signEmailError;

  String get signPassHint;

  String get signPassError;

  String get signPhoneHint;

  String get signPhoneError;

  String get signError;

  String get signSwitch;

  ///End SignUp

  /// Start SearchHintText

  String get ps3SearchHint;

  String get ps4SearchHint;

  String get ps5SearchHint;

  String get x3SearchHint;

  String get x4SearchHint;

  String get x5SearchHint;

  /// End SearchHintText

  /// Start Filter

  String get price;

  String get filterUnit;

  String get filterTextField1;

  String get filterTextField2;

  String get condition;

  String get buy;

  String get sell;

  String get used;

  String get new1;

  String get filterButton;

  /// End Filter

  ///Start Filter

  String get sortLabel;

  String get sortChoice1;

  String get sortChoice2;

  ///End Sort

  ///Start SideBar

  String get sideAds;

  String get sideAdd;

  String get sidePremium;

  String get sideOut;

  ///End SideBar

  ///Start AddAd

  String get addAppBar;

  String get addTitleHint;

  String get addTitleError;

  String get addDescHint;

  String get addPriceHint;

  String get addPriceError;

  String get addNeighborhoodHint;

  String get addCity;

  String get addCityError;

  String get addCondition;

  String get addConditionError;

  String get addSOrB;

  String get addSOrBError;

  String get addType;

  String get addTypeError;

  String get addButton;

  //Start CityChoices

  String get amman;

  String get irbid;

  String get zarqa;

  String get jerash;

  String get alBalqa;

  String get tafilah;

  String get ajloun;

  String get alAqaba;

  String get karak;

  String get madaba;

  String get maan;

  String get mafraq;

  //End CityChoices

  ///End AddAd

  ///Start Details

  String get detailsLocation;

  String get detailsCreated;

  String get detailsCall;

  ///End Details

  ///Start User

  String get userJoined;

  String get userAds;

  ///End User
}
