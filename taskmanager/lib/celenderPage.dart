import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CelenderPage extends StatefulWidget {
  final CelenderPage celenderPage;
  CelenderPage({this.celenderPage});
  @override
  _CelenderPageState createState() => _CelenderPageState();
}

class _CelenderPageState extends State<CelenderPage> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  int currentIndex = 0;
  int _selectedNaviBar = 0;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: _events,
              calendarStyle: CalendarStyle(
                todayColor: Colors.orange,
                selectedColor: Colors.green,
                todayStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              calendarController: _controller,
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events) {
                setState(() {
                  _selectedEvents = events;
                });
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(date.day.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
                todayDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(date.day.toString(),
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            ..._selectedEvents.map((event) => ListTile(
                  title: Text(event),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAddDialog,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        fixedColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: SizedBox(
              height: 0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: SizedBox(
              height: 0,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            title: SizedBox(
              height: 0,
            ),
          ),
        ],
        currentIndex: _selectedNaviBar,
        onTap: _onItemTapped,
      ),
    );
  }

  _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          autofocus: true,
          decoration: new InputDecoration(
            labelText: 'Etkinlik Giriniz',
          ),
          controller: _eventController,
        ),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: FlatButton(
              child: Text(
                "Kaydet",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  void _onItemTapped(int index2) {
    if (currentIndex == 1) {
      if (_eventController.text.isEmpty) return;
      setState(() {
        if (_events[_controller.selectedDay] != null) {
          _events[_controller.selectedDay].add(_eventController.text);
        } else {
          _events[_controller.selectedDay] = [_eventController.text];
        }
        _eventController.clear();
        Navigator.pop(context);
      });
    } else {
      alerDialogScreen(context);
    }
  }
}

void alerDialogScreen(BuildContext context) {
  var alertDialog = CupertinoAlertDialog(
    content: Text("Özellik Yakında Kullanıma Sunulacaktır."),
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}
