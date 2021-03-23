import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cstore/post.dart';
import 'package:cstore/post_list.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  final Color bigColor;
  final Color lightColor;
  final Color textColor;
  final Color borderColor;
  final String collectionName;

  Search(
      {this.bigColor,
      this.lightColor,
      this.textColor,
      this.borderColor,
      this.collectionName});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(collectionName).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Center(child: Text('Loading...'));

        final results = snapshot.data.docs.where(
            (a) => a['title'].toLowerCase().contains(query.toLowerCase()));

        return ListView(
          children: results
              .map<Widget>(
                (p) => PostCard(
                  textColor: textColor,
                  borderColor: borderColor,
                  lightColor: lightColor,
                  bigColor: bigColor,
                  post: Post(
                    title: p.data()['title'],
                    time: p.data()['time'],
                    price: p.data()['price'],
                    url: p.data()['url'] ?? 'No Image.',
                    uid: p.data()['uid'],
                    sOrB: p.data()['sOrb'],
                    neighborhood: p.data()['neighborhood'],
                    description: p.data()['description'] ?? 'No More details',
                    condition: p.data()['condition'],
                    city: p.data()['city'],
                    dateTime: p.data()['creationTime'],
                    phoneNum: p.data()['phone_number'],
                    userName: p.data()['username'],
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
  //

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(collectionName).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) return Text('Loading...');

        final results =
            snapshot.data.docs.where((a) => a['title'].contains(query));

        return ListView(
          children: results
              .map<Widget>(
                (p) => PostCard(
                  textColor: textColor,
                  borderColor: borderColor,
                  lightColor: lightColor,
                  bigColor: bigColor,
                  post: Post(
                    title: p.data()['title'],
                    time: p.data()['time'],
                    price: p.data()['price'],
                    url: p.data()['url'] ?? 'No Image.',
                    uid: p.data()['uid'],
                    sOrB: p.data()['sOrb'],
                    neighborhood: p.data()['neighborhood'],
                    description: p.data()['description'] ?? 'No More details',
                    condition: p.data()['condition'],
                    city: p.data()['city'],
                    dateTime: p.data()['creationTime'],
                    phoneNum: p.data()['phone_number'],
                    userName: p.data()['username'],
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
