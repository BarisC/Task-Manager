import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'celenderPage.dart';
import 'celenderSetPage.dart';
import 'intro.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "/CelenderPage": (context) => CelenderPage(),
        "/CelenderSetPage": (context) => CelenderSetPage(),
      },
      //home: HomePage(),
    ));
