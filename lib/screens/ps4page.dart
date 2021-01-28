import 'package:cstore/constant.dart';
import 'package:cstore/screens/add_ad_page.dart';
import 'package:flutter/material.dart';

import 'acoount_page.dart';

class Ps4Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showSortSettings() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              color: Colors.grey[600],
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sort By',
                        style: TextStyle(
                            color: kPsBigColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      color: kPsBigColor.withOpacity(0.5),
                      height: 1,
                      width: double.infinity,
                    )
                  ],
                ),
              ),
            );
          });
    }

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color(0xFFC6C1E6),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20,
                    color: kPsBigColor.withOpacity(0.5),
                  ),
                ),
                floating: true,
                pinned: true,
                backgroundColor: Colors.white,
                centerTitle: true,
                expandedHeight: 113,
                title: TextField(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: Search(),
                    );
                  },
                  cursorWidth: 1,
                  decoration: InputDecoration.collapsed(
                    fillColor: kPsBigColor,
                    hintText: '  Search in Ps4 Store',
                    focusColor: kPsBigColor,
                    border: OutlineInputBorder(),
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.person,
                      color: kPsBigColor,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountPage(),
                        ),
                      );
                    },
                  )
                ],
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  isScrollable: false,
                  tabs: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(11),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.filter_list,
                              color: kPsBigColor,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Filter',
                              style:
                                  TextStyle(color: kPsBigColor, fontSize: 20),
                            )
                          ],
                        ),
                        onTap: () {
                          _showSortSettings();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(11),
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RotatedBox(
                              quarterTurns: 1,
                              child: Icon(
                                Icons.compare_arrows,
                                color: kPsBigColor,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Sort',
                              style: TextStyle(
                                color: kPsBigColor,
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                        onTap: () {
                          _showSortSettings();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: 300,
                        child: Text('hello $index'),
                        color: Colors.white,
                      ),
                    );
                  },
                  childCount: 20,
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPage(),
                ),
              );
            },
            backgroundColor: Colors.white,
            elevation: 10,
            child: Icon(
              Icons.add,
              color: kPsBigColor,
            ),
          ),
        ),
      ),
    );
  }
}

class Search extends SearchDelegate {
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
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text(query);
  }
}
