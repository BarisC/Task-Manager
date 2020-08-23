import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CelenderSetPage extends StatefulWidget {
  final CelenderSetPage celenderSetPage;
  CelenderSetPage({this.celenderSetPage});
  @override
  _CelenderSetPageState createState() => _CelenderSetPageState();
}

class _CelenderSetPageState extends State<CelenderSetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: new Text("Selam"),
      ),
    );
  }
}
