import 'dart:math';

import 'package:flutter/material.dart';

class Searching extends StatefulWidget {
  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan for Bluetooth devices"),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            return _buildRow("Device #" + i.toString(), _getRandomAddress(), i);
          }
      ),
    );
  }

  Widget _buildRow(String name, String address, int i) {
    return ListTile(
      title: Text(name),
      subtitle: Text(address),
      trailing: (
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            color: Colors.grey,
            child: Text("Connect"),
            onPressed: (){
              _onPressed(i);
            },
          )
      ),
      onTap: (){
        _onPressed(i);
      },
    );
  }

  void _onPressed(i){
    print("Pressed: " + i.toString());
    //setState(() {});
  }

  String _getRandomAddress()
  {
    Random random = new Random();
    String string = "";
    for (int i = 0; i < 6; ++i)
      string += random.nextInt(256).toRadixString(16).padLeft(2, '0').toUpperCase() + (i != 5 ? ":" : "");

    return string;
  }
}
