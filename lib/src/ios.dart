import 'package:flutter/material.dart';
import 'package:flolearn/allflows.dart';
import 'package:provider/provider.dart';

class Ios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Flows>(context);
    return ListView(
      children: appState.ios,
    );
  }
}
