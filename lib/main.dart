import 'package:flutter/material.dart';
import 'src/home.dart';
import 'package:provider/provider.dart';
import 'package:flolearn/allflows.dart';

void main() => runApp(
      ChangeNotifierProvider<Flows>(
        builder: (context) => Flows(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
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
