import 'package:flutter/material.dart';
import 'package:flolearn/src/card.dart';
import 'package:flolearn/src/web.dart';
import 'package:flolearn/src/favorites.dart';
import 'package:flolearn/src/ios.dart';
import 'package:provider/provider.dart';
import 'package:flolearn/allflows.dart';

class Home extends StatefulWidget {
  final List<Widget> _categoryTabs = [
    Tab(
      child: Text('Favorites'),
    ),
    Tab(
      child: Text('Web Dev'),
    ),
    Tab(
      child: Text('iOS'),
    ),
  ];
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _categoryController;

  @override
  void initState() {
    super.initState();
    _categoryController = TabController(
      vsync: this,
      length: 3,
    );
  }

  @override
  void dispose() {
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'FloLearn',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Ubuntu',
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: FlowSearch(),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _categoryController,
          isScrollable: true,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black.withOpacity(0.3),
          indicatorColor: Colors.black,
          tabs: widget._categoryTabs,
        ),
      ),
      body: TabBarView(
        controller: _categoryController,
        children: <Widget>[
          Favorites(),
          Webs(),
          Ios(),
        ],
      ),
    );
  }
}

class FlowSearch extends SearchDelegate<FlowCard> {
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
    final appState = Provider.of<Flows>(context);
    return (query != '')
        ? (appState.searchFlows(query).length != 0)
            ? ListView(
                children: appState.searchFlows(query),
              )
            : Container(
                child: Center(
                  child: Text(
                    "Sorry, couldn't find a track",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 30,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ),
              )
        : Container(
            child: Center(
              child: Text(
                'Search for Tracks',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 30,
                  fontFamily: 'Ubuntu',
                ),
              ),
            ),
          );
  }
}
