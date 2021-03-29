import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String email;
  final String pws;

  const HomePage ({Key key, this.email, this.pws}): super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(getString(_index)),
          ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: _test,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: "Account",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "Recenti",
          ),
        ],
      ),
    );
  }

  void _test(int i) {
    print(i);
    setState(() {
      _index = i;
    });
  }

  String getString(int i)
  {
    switch(i)
    {
      case 0:
        return "Account\n" + widget.email;
      case 1:
        return "History\n" + "empty";
    }
    return "";
  }
}