import 'package:flutter/material.dart';
import 'package:flolearn/src/card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flolearn/src/home.dart';
import 'package:flolearn/flows/reactflow.dart';

class Flows with ChangeNotifier {
  static var _favorites = [-1, -1, -1, -1, -1, -1];
  final _web = [0, 1, 2];
  final _ios = [3, 4, 5];
  var prefs;
  // final _searchTags = {
  //   0: "toothpick pattern algorithm sequence ",
  //   1: "langtons ant pattern algorithm ",
  //   2: "bubble sort algorithm sorting bars ",
  //   3: "insertion sort algorithm sorting bars ",
  //   4: "rose pattern mathematics sequence ",
  //   5: "fourier series mathematics ",
  //   6: "pi approximation monte carlo method ",
  // };

  Flows() {
    getFavorites();
  }

  getFavorites() async {
    prefs = await SharedPreferences.getInstance();
    List<String> myList = (prefs.getStringList('favorites') ?? List<String>());
    if (myList.length != 0) {
      _favorites = myList.map((i) => int.parse(i)).toList();
    }
  }

  List<Widget> allFlows() {
    return <Widget>[
      FlowCard(
        id: 0,
        flowName: 'Full Stack React',
        image: 'assets/images/react.png',
        direct: ReactFlow(),
        about: '',
        fav: _favorites[0],
      ),
      FlowCard(
        id: 1,
        flowName: 'Complete Frontend Web',
        image: 'assets/images/frontendweb.jpg',
        direct: Home(),
        about: '',
        fav: _favorites[1],
      ),
      FlowCard(
        id: 2,
        flowName: 'Complete Backend Web',
        image: 'assets/images/backendweb.png',
        direct: Home(),
        about: '',
        fav: _favorites[2],
      ),
      FlowCard(
        id: 3,
        flowName: 'Full Stack iOS Dev',
        image: 'assets/images/react.png',
        direct: Home(),
        about: '',
        fav: _favorites[3],
      ),
      FlowCard(
        id: 4,
        flowName: 'Complete Swift',
        image: 'assets/images/completeswift.png',
        direct: Home(),
        about: '',
        fav: _favorites[4],
      ),
      FlowCard(
        id: 5,
        flowName: 'Complete Objective-C',
        image: 'assets/images/completeobjectivec.png',
        direct: Home(),
        about: '',
        fav: _favorites[5],
      ),
    ];
  }

  // List<Widget> get all {
  //   getFavorites();
  //   return allSimulations();
  // }

  List<Widget> get web {
    getFavorites();
    List<Widget> widgets = [];
    List<Widget> allWidgets = allFlows();
    _web.forEach((index) => widgets.add(allWidgets[index]));
    return widgets;
  }

  List<Widget> get ios {
    getFavorites();
    List<Widget> widgets = [];
    List<Widget> allWidgets = allFlows();
    _ios.forEach((index) => widgets.add(allWidgets[index]));
    return widgets;
  }

  // List<Widget> get mathematics {
  //   getFavorites();
  //   List<Widget> widgets = [];
  //   List<Widget> allWidgets = allSimulations();
  //   _mathematics.forEach((index) => widgets.add(allWidgets[index]));
  //   return widgets;
  // }

  // List<Widget> get chemistry {
  //   getFavorites();
  //   List<Widget> widgets = [];
  //   List<Widget> allWidgets = allSimulations();
  //   _chemistry.forEach((index) => widgets.add(allWidgets[index]));
  //   return widgets;
  // }

  List<Widget> get favorites {
    getFavorites();
    List<Widget> widgets = [];
    List<Widget> allWidgets = allFlows();
    for (int i = 0; i < _favorites.length; ++i) {
      if (_favorites[i] == 1) {
        widgets.add(allWidgets[i]);
      }
    }
    return widgets;
  }

  // List<Widget> searchSims(String query) {
  //   query = query.toLowerCase();
  //   List<Widget> widgets = [];
  //   List<Widget> allWidgets = allSimulations();
  //   final regex = RegExp('$query[a-z]* ');
  //   _searchTags.forEach((key, tags) {
  //     if (regex.hasMatch(tags)) {
  //       widgets.add(allWidgets[key]);
  //     }
  //   });
  //   return widgets;
  // }

  void toggleFavorite(int index) async {
    _favorites[index] *= -1;
    List<String> favorites = _favorites.map((i) => i.toString()).toList();
    await prefs.setStringList('favorites', favorites);
    notifyListeners();
  }
}
