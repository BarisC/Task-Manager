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
          height: 90,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 50,
                left: MediaQuery.of(context).size.width / 4,
                child: Text(
                  "My Task Manager",
                  style: TextStyle(
                      fontFamily: "AvenirBold",
                      fontSize: 25,
                      color: Colors.lightGreen),
                ),
              ),
              if (widget.index ==
                  0) //İlk sayfada swap iconu kullanmak için if else yapısı
                swapPage(),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 1),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                  width: 300,
                  height: 250,
                  child: Image.asset(
                    imagePath[widget.index],
                    //fit: BoxFit.fitWidth,
                  ),
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
                      horizontal: 35), //Horizontal olarak daraltıyor.
                  child: new Text(
                    description[widget.index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
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
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          child: Stack(
            children: <Widget>[DotsIndicators(widget.index)],
          ),
        ),
        Container(
          child: widget.index == 1 ? Basla() : null,
        ),
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
              border: Border.all(color: Colors.black),
              shape: BoxShape.circle,
              color: index == widget.pageIndex ? Colors.black : Colors.white),
        );
      },
    );
  }
}

class Basla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CupertinoButton(
      child: Text(
        "BAŞLA!",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey,
    );
  }
}

class swapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      top: 50,
      child: Icon(
        Icons.arrow_forward,
        color: Colors.grey,
        size: 24.0,
      ),
    );
  }
}
