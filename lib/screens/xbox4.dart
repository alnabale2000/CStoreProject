// import 'package:flutter/material.dart';
//
// class XBox4Store extends StatelessWidget {
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cstore/components/filter_settings.dart';
import 'package:cstore/components/side_bar.dart';
import 'package:cstore/components/sort_settings.dart';
import 'package:cstore/constant.dart';
import 'package:cstore/languages/languages.dart';
import 'package:cstore/post.dart';
import 'package:cstore/screens/add_ad_page.dart';
import 'package:cstore/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../post_list.dart';
import '../search.dart';

class XBox4Store extends StatefulWidget {
  final List<String> results;
  final bool loading;

  XBox4Store({this.results, this.loading});

  @override
  _XBox4StoreState createState() => _XBox4StoreState();
}

class _XBox4StoreState extends State<XBox4Store> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User logedInUser;
  String username;
  String phoneNumber;
  String uid;
  String dateTime;

  double startValue = 1;
  double endValue = 999;
  String sOrB;
  String uOrN;
  bool boolean;
  String orderRule;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getSortValue(String rule, bool bool) {
    setState(() {
      orderRule = rule;
      boolean = bool;
    });
  }

  void getFilterValue(String sb, String un, double startVal, double endVal) {
    setState(() {
      startValue = startVal;
      endValue = endVal;
      sOrB = sb;
      uOrN = un;
    });
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) logedInUser = user;
      uid = logedInUser.uid;
      var userData =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      setState(() {
        username = userData.data()['username'];
        phoneNumber = userData.data()['phoneNumber'];
        dateTime = userData.data()['creationTime'];
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    print('IN PS 4 STORE $boolean &&& $orderRule');

    return StreamProvider<List<Post>>.value(
      value: DataBaseService(
                  orderRule: orderRule,
                  boolean: boolean,
                  startPrice: startValue.round(),
                  finalPrice: endValue.round(),
                  sOrb: sOrB,
                  uOrN: uOrN,
                  collection: 'x4')
              .posts ??
          Center(
            child: Text('NO DATA'),
          ),
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Color(0xFFB0E3B4),
            endDrawer: SideBar(
              bigColor: kXboxBigColor,
              lightColor: kXboxLightColor,
              uid: uid,
              username: username,
              phoneNumber: phoneNumber,
              dateTime: dateTime,
            ),
            body: CustomScrollView(
              slivers: <Widget>[
                buildSliverAppBar(context),
                PostList(
                  bigColor: kXboxBigColor,
                  lightColor: kXboxLightColor,
                  textColor: kXboxTextColor,
                  borderColor: kXboxBorderColor,
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              elevation: 10,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPage(),
                  ),
                );
              },
              child: Icon(
                Icons.add,
                color: kPsLightColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  SliverAppBar buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      iconTheme: IconThemeData(color: kXboxBigColor),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          size: 25,
          color: kXboxBigColor,
        ),
      ),
      floating: true,
      pinned: true,
      backgroundColor: Colors.white,
      centerTitle: true,
      expandedHeight: 110,
      title: Container(
        height: 40,
        child: TextField(
          onTap: () {
            showSearch(
              context: context,
              delegate: Search(
                bigColor: kXboxBigColor,
                borderColor: kXboxBorderColor,
                lightColor: kXboxLightColor,
                textColor: kXboxTextColor,
                collectionName: 'xBox1',
              ),
            );
          },
          cursorWidth: 1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
            fillColor: kXboxBigColor,
            hintText: Languages.of(context).x4SearchHint,
            focusColor: kXboxBigColor,
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: kPsLightColor),
            ),
          ),
        ),
      ),
      bottom: TabBar(
        indicatorColor: Colors.white,
        isScrollable: false,
        tabs: <Widget>[
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    context: context,
                    builder: (context) {
                      return FilterSettings(
                        function: getFilterValue,
                        bigColor: kXboxBigColor,
                        lightColor: kXboxLightColor,
                      );
                    });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.filter_list,
                    color: kXboxBigColor,
                  ),
                  SizedBox(width: 10),
                  Text(
                    Languages.of(context).filter,
                    style: TextStyle(color: kXboxBigColor, fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: GestureDetector(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RotatedBox(
                    quarterTurns: 1,
                    child: Icon(
                      Icons.compare_arrows,
                      color: kXboxBigColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    Languages.of(context).sort,
                    style: TextStyle(
                      color: kXboxBigColor,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    context: context,
                    builder: (context) {
                      return SortSettings(
                        function: getSortValue,
                        bigColor: kXboxBigColor,
                        lightColor: kXboxLightColor,
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
