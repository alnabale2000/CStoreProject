import 'package:cached_network_image/cached_network_image.dart';
import 'package:cstore/components/loading.dart';
import 'package:cstore/constant.dart';
import 'package:cstore/languages/languages.dart';
import 'package:cstore/screens/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class PostDetails extends StatelessWidget {
  final String title;
  final String description;
  final String city;
  final String neighborhood;
  final String condition;
  final String sOrB;
  final String url;
  final String username;
  final String phoneNumber;
  final String time;
  final String uid;
  final String dateTime;
  final int price;
  final Color bigColor;
  final Color lightColor;

  PostDetails(
      {this.title,
      this.description,
      this.city,
      this.neighborhood,
      this.condition,
      this.sOrB,
      this.url,
      this.username,
      this.phoneNumber,
      this.price,
      this.time,
      this.uid,
      this.dateTime,
      this.lightColor,
      this.bigColor});

  void call(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print('Call cant complete');
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateTime time1 = DateTime.parse(time);
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                elevation: 10,
                expandedHeight: 230,
                flexibleSpace: url != 'No Image.'
                    ? Hero(
                        tag: url,
                        child: CachedNetworkImage(
                          imageUrl: url,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Loading(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      )
                    : Container(
                        color: Colors.grey[300],
                        child: Image.asset(
                          'images/CStoreLogo.png',
                          color: bigColor,
                        ),
                      )),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: bigColor,
                        fontSize: 22.5,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: lightColor.withOpacity(0.01),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: bigColor.withOpacity(0.2),
                            width: 0.9,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Text(
                                        '${Languages.of(context).detailsLocation} : $city/$neighborhood',
                                        style: kDetailsTextStyle),
                                    Spacer(),
                                    Icon(
                                      Icons.place_outlined,
                                      color: lightColor,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Text(
                                      '${Languages.of(context).condition} : $condition',
                                      style: kDetailsTextStyle,
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.build,
                                      color: lightColor,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Text(
                                      '${Languages.of(context).price} : $price',
                                      style: kDetailsTextStyle,
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.attach_money,
                                      color: lightColor,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Text(
                                      '${Languages.of(context).detailsCreated} : ${timeago.format(time1)}',
                                      style: kDetailsTextStyle,
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.access_time_outlined,
                                      color: lightColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: lightColor.withOpacity(0.01),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: bigColor.withOpacity(0.2),
                            width: 0.9,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                Languages.of(context).addDescHint,
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(22.5, 10, 10, 10),
                              child: Text(
                                description,
                                style: kDetailsTextStyle.copyWith(
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Text(
                            username,
                            style: TextStyle(
                              fontSize: 25,
                              color: bigColor,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserStore(
                                  uid: uid,
                                  phoneNumber: phoneNumber,
                                  username: username,
                                  dateTime: dateTime,
                                  collection: 'm',
                                ),
                              ),
                            );
                          },
                        ),
                        Spacer(),
                        FlatButton(
                          child: Row(
                            children: [
                              Text(
                                Languages.of(context).detailsCall,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: bigColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                              Icon(
                                Icons.phone,
                                color: bigColor,
                              ),
                            ],
                          ),
                          onPressed: () {
                            call('tel:$phoneNumber');
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
