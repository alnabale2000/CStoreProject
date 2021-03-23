import 'package:cstore/constant.dart';
import 'package:cstore/languages/languages.dart';
import 'package:cstore/screens/add_ad_page.dart';
import 'package:cstore/screens/language_page.dart';
import 'package:cstore/screens/user_store.dart';
import 'package:cstore/services/auth.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  final String uid;
  final String username;
  final String phoneNumber;
  final String dateTime;
  final Color bigColor;
  final Color lightColor;

  SideBar(
      {this.uid,
      this.username,
      this.phoneNumber,
      this.dateTime,
      this.lightColor,
      this.bigColor});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset(
                'images/CStoreLogo.png',
                color: bigColor,
              ),
            ),
            SizedBox(height: 20),
            SideTile(
              text: Languages.of(context).sideAds,
              icon: Icons.account_box_outlined,
              color: bigColor,
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return UserStore(
                        uid: uid,
                        username: username,
                        phoneNumber: phoneNumber,
                        dateTime: dateTime,
                        collection: '',
                      );
                    },
                  ),
                );
              },
            ),
            SideTile(
                text: Languages.of(context).sideAdd,
                icon: Icons.add,
                color: bigColor,
                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddPage();
                  }));
                }),
            SideTile(
              text: Languages.of(context).sidePremium,
              icon: Icons.add_moderator,
              color: bigColor,
            ),
            SizedBox(
              height: 18.5,
            ),
            Container(
              height: 0.2,
              color: kPsLightColor,
            ),
            SizedBox(
              height: 10,
            ),
            SideTile(
              text: Languages.of(context).sideOut,
              icon: Icons.logout,
              color: bigColor,
              function: () {
                AuthService().signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return LanguagePage();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SideTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function function;
  final Color color;
  final bool needSubtitle;

  SideTile(
      {this.text, this.icon, this.function, this.color, this.needSubtitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(color: color, fontSize: 22),
          ),
          trailing: Icon(
            icon,
            color: color,
          ),
          dense: true,
        ),
      ),
      onTap: function,
    );
  }
}
