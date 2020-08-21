import 'package:flutter/cupertino.dart';
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
      items: [0, 1].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                //decoration: BoxDecoration(color: Colors.blue[200]),
                child: IntroP(i));
          },
        );
      }).toList(),
    );
  }
}

// ignore: must_be_immutable
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
                    widget.index == 1 ? "DONE" : "SKIP",
                    style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontFamily: "SultanNahia"),
                  ))
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 50),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Image.asset(
                  imagePath[widget.index],
                  fit: BoxFit.fitWidth,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Center(
                    child: new Text(
                      title[widget.index],
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: "Caslon"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(
                      horizontal: 40), //Horizontal olarak daraltıyor.
                  child: new Text(
                    description[widget.index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor,
                      fontFamily: "Caslon",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          child: Stack(
            children: <Widget>[
              DotsIndicators(widget.index),
            ],
          ),
        )
      ],
    );
  }
}

class DotsIndicators extends StatefulWidget {
  int pageIndex;
  DotsIndicators(this.pageIndex);
  @override
  _DotsIndicatorsState createState() => _DotsIndicatorsState();
}

class _DotsIndicatorsState extends State<DotsIndicators> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (context, int index) {
        return Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(right: 5),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == widget.pageIndex ? Colors.black : Colors.red),
        );
      },
    );
  }
}
