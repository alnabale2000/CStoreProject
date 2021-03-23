import 'package:cstore/components/loading.dart';
import 'package:cstore/languages/languages.dart';
import 'package:cstore/post.dart';
import 'package:cstore/screens/post_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';

class PostList extends StatelessWidget {
  final Color bigColor;
  final Color lightColor;
  final Color textColor;
  final Color borderColor;

  PostList({this.bigColor, this.lightColor, this.borderColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<Post>>(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            child: Container(
              child: PostCard(
                post: posts[index],
                bigColor: bigColor,
                lightColor: lightColor,
                textColor: textColor,
                borderColor: borderColor,
              ),
            ),
          );
        },
        childCount: posts?.length ?? 0,
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final Post post;
  final Color bigColor;
  final Color lightColor;
  final Color textColor;
  final Color borderColor;

  PostCard(
      {this.post,
      this.lightColor,
      this.bigColor,
      this.borderColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    final DateTime time = DateTime.parse('${post.time}');

    String sOrB() {
      if (Languages.of(context).isArabic) {
        if (post.sOrB == 'Sell') post.sOrB = 'بيع';
        if (post.sOrB == 'Buy') post.sOrB = 'شراء';
      }
      return post.sOrB;
    }

    String condition() {
      if (Languages.of(context).isArabic) {
        if (post.condition == 'Used') post.condition = 'مستعمل';
        if (post.condition == 'New') post.condition = 'جديد';
      }
      return post.condition;
    }

    String city() {
      if (Languages.of(context).isArabic) {
        if (post.city == 'Amman') post.city = 'عمان';
        if (post.city == 'Al-Aqaba') post.city = 'العقبة';
        if (post.city == 'Irbid') post.city = 'اربد';
        if (post.city == 'Jerash') post.city = 'جرش';
        if (post.city == "Ma'an") post.city = 'معان';
        if (post.city == 'Mafraq') post.city = 'المفرق';
        if (post.city == 'At-Tafilah') post.city = 'الطفيلة';
        if (post.city == 'Madaba') post.city = 'مأدبا';
        if (post.city == 'Karak') post.city = 'الكرك';
        if (post.city == 'Ajloun') post.city = 'عجلون';
        if (post.city == 'Zarqa') post.city = 'الزرقاء';
        if (post.city == 'Al-Balqa') post.city = 'البلقاء';
      }
      return post.city;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostDetails(
                title: post.title,
                sOrB: post.sOrB,
                city: post.city,
                username: post.userName,
                phoneNumber: post.phoneNum,
                url: post.url,
                description: post.description,
                price: post.price,
                neighborhood: post.neighborhood,
                condition: post.condition,
                time: post.time,
                uid: post.uid,
                dateTime: post.dateTime,
                bigColor: bigColor,
                lightColor: lightColor,
              ),
            ),
          );
        },
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 230,
                child: post.url != 'No Image.'
                    ? Hero(
                        tag: post.url,
                        child: CachedNetworkImage(
                          imageUrl: post.url ?? 'sajdlk',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Loading(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      )
                    : Image.asset(
                        'images/CStoreLogo.png',
                        color: bigColor,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 8),
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          '${post.title} ',
                          style: TextStyle(
                              color: lightColor,
                              fontSize: 23,
                              letterSpacing: 0.5),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InformationBox(
                          text: city(),
                          lightColor: lightColor,
                          bigColor: bigColor,
                          textColor: textColor,
                          borderColor: borderColor,
                        ),
                        SizedBox(width: 10),
                        InformationBox(
                          text: sOrB(),
                          lightColor: lightColor,
                          bigColor: bigColor,
                          textColor: textColor,
                          borderColor: borderColor,
                        ),
                        SizedBox(width: 10),
                        InformationBox(
                          text: condition(),
                          lightColor: lightColor,
                          bigColor: bigColor,
                          textColor: textColor,
                          borderColor: borderColor,
                        ),

                        // Container(child: Text(post.sOrB)),
                        // Container(child: Text(post.condition)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '${timeago.format(time, locale: 'en')}.',
                            style: TextStyle(color: lightColor),
                          ),
                          Spacer(),
                          Text(
                            '${post.price} ${Languages.of(context).filterUnit}',
                            style: TextStyle(color: bigColor, fontSize: 20),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InformationBox extends StatelessWidget {
  const InformationBox(
      {@required this.text,
      this.bigColor,
      this.lightColor,
      this.textColor,
      this.borderColor});

  final String text;
  final Color bigColor;
  final Color lightColor;
  final Color textColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                letterSpacing: 2,
                color: textColor, //Color(0xEF1E50AE),
                fontSize: 16.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xFFE8E8E8),
          border: Border.all(color: borderColor, width: 1.8),
          boxShadow: [
            BoxShadow(
              color: lightColor.withOpacity(0.4),
              offset: Offset(1, 4),
              blurRadius: 3,
              spreadRadius: -3,
            )
          ],
        ),
      ),
    );
  }
}
