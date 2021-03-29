import 'package:flutter/material.dart';
import 'package:sanificatori/Account.dart';
import 'package:sanificatori/Device.dart';
import 'package:sanificatori/Searching.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: setIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.account_circle
              ),
            label: "Account",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.bar_chart
              ),
              label: "Device"
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.bluetooth_searching
              ),
              label: "Searching"
          )
        ],
      ),
    );
  }

  void setIndex(int i) {
    setState(() {
      _index = i;
    });
  }

  Widget getBody()
  {
    switch(_index) {
      case 0:
        return Account();
      case 1:
        return Device();
      case 2:
        return Searching();
    }
  }
}
