import 'package:cstore/languages/languages.dart';
import 'package:cstore/post.dart';
import 'package:cstore/post_list.dart';
import 'package:cstore/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cstore/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class UserStore extends StatelessWidget {
  final String uid;
  final String username;
  final String phoneNumber;
  final String dateTime;
  final List<Post> post;
  final String collection;

  UserStore(
      {this.uid,
      this.phoneNumber,
      this.username,
      this.post,
      this.dateTime,
      this.collection});

  void call(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('Call cant complete');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(' IN USER STORE NIGGA $uid');
    return StreamProvider<List<Post>>.value(
      value: DataBaseService(idFromUserStore: uid, collection: 'm').posts,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              forceElevated: true,
              pinned: true,
              title: Text(
                username,
                style: TextStyle(color: kNeturalBigColor),
              ),
              iconTheme: IconThemeData(color: kNeturalBigColor),
              backgroundColor: Colors.white,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            'images/CStoreLogo.png',
                            width: 110,
                          ),
                        ),
                        Text(
                          username,
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          '${Languages.of(context).userJoined} : ${dateTime.replaceRange(10, 23, '')} ',
                          style:
                              TextStyle(color: kNeturalBigColor, fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: RaisedButton(
                              color: const Color(0xFFEFFFFE),
                              elevation: 0.5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      Languages.of(context).detailsCall,
                                      style: TextStyle(
                                        color: kLightBlack,
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(Icons.call, color: kLightBlack),
                                    Spacer(),
                                    Text(
                                      phoneNumber,
                                      style: TextStyle(
                                        color: kLightBlack,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () {
                                call('tel:$phoneNumber');
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Center(
                          child: Text(
                            Languages.of(context).userAds,
                            style: TextStyle(
                              color: kNeturalBigColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.5,
                            ),
                          ),
                        ),
                        Container(
                          height: 2,
                          width: double.infinity,
                          color: Color(0xFF3388FF),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PostList(
              bigColor: kNeturalBigColor,
              lightColor: Color(0xFF229B91),
              borderColor: Color(0xAF1EAE66),
              textColor: Color(0xEF229B91),
            ),
          ],
        ),
      ),
    );
  }
}
