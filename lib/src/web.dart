import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flolearn/src/card.dart';

class Webs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 5,
        ),
        FlowCard(
          direct: Home(),
          fav: 1,
          flowName: "Learn React",
          id: 1,
          about: "",
          image: "assets/images/react.png",
        ),
      ],
    );
  }
}
