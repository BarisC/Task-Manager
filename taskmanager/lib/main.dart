import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'attr.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      home: HomePage(),
    ));

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentPage(),
    );
  }
}

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        enableInfiniteScroll: false,
        initialPage: 0,
        reverse: false,
        viewportFraction: 1.0,
        aspectRatio: MediaQuery.of(context).size.aspectRatio,
        height: MediaQuery.of(context).size.height - 30,
      ),
      items: [0, 1, 2].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.green[200]),
                child: IntroP(i));
          },
        );
      }).toList(),
    );
  }
}

class IntroP extends StatefulWidget {
  int index;
  IntroP(this.index);
  @override
  _IntroPState createState() => _IntroPState();
}

class _IntroPState extends State<IntroP> {
  @override
  void initState() {
    super.initState();
    print(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Stack(
            children: <Widget>[
              Positioned(
                  left: 24,
                  top: 20,
                  child: Text(
                    "My Task Manager",
                    style: TextStyle(fontFamily: "AvenirBold", fontSize: 16),
                  )),
              Positioned(
                  right: 24,
                  top: 20,
                  child: Text(
                    widget.index == 2 ? "DONE" : "SKIP",
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontFamily: "SultanNahia"),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
