import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FloLearn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  final List<Widget> _categoryTabs = [
    Tab(
      child: Text('Home'),
    ),
    Tab(
      child: Text('Web Dev'),
    ),
    Tab(
      child: Text('Android'),
    ),
    Tab(
      child: Text('Blockchain'),
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
      length: 4,
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
              // showSearch(
              //   context: context,
              //   delegate: SimulationSearch(),
              // );
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
          // HomePage(),
          // PhysicsPage(),
          // AlgorithmsPage(),
          // MathematicsPage(),
          // ChemistryPage(),
          Container(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}