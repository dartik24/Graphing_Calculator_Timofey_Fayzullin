import 'package:flutter/material.dart';
import 'home_page.dart';
import 'graph_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Calculator",
      theme: new ThemeData(primaryColor: Colors.blue),
      home: new HomePage(),
    );
  }
}
