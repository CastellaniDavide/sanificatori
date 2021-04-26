import 'package:flutter/material.dart';
import 'package:sanificatori/Account.dart';
import 'package:sanificatori/Device.dart';
import 'package:sanificatori/Searching.dart';

import 'global.dart' as global;
import 'main.dart';

void main() {
  runApp(MyApp());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _index = 0;

  @override
  void initState() {
    super.initState();

    global.quickActions.initialize((String shortcutType) {
      setState(() {
        if (shortcutType == "action") {
          _index = 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: setIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Account",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Device"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bluetooth_searching), label: "Searching")
        ],
      ),
    );
  }

  void setIndex(int i) {
    setState(() {
      _index = i;
    });
  }

  Widget getBody() {
    switch (_index) {
      case 0:
        return Account();
      case 1:
        return Device();
      case 2:
        return Searching();
    }
  }
}
