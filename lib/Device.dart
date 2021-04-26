import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sanificatori/Searching.dart';
import 'package:sanificatori/global.dart' as global;
import 'package:shared_preferences/shared_preferences.dart';

class Device extends StatefulWidget {
  @override
  _DeviceState createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  BTDevice device;
  TextEditingController _textEditingController =
      new TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    _getDevice();

    return Scaffold(
        appBar: AppBar(
          title: Text("Device"),
        ),
        body: Column(
          children: <Widget>[
            TextField(controller: _textEditingController),
            TextButton(onPressed: _onPressed, child: Text("Salva")),
          ],
        ));
  }
  /*Future<BTDevice> getDevice() async {
    var prefs = await SharedPreferences.getInstance();
    BTDevice.fromJson(jsonDecode(prefs.getString("pref_device")));
  }*/

  _onPressed() {
    device.name = _textEditingController.text;
    global.sDevice(device);
    global.changeAction(_textEditingController.text);
  }

  _getDevice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Fluttertoast.showToast(
        msg: prefs.getString("pref_device"),
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
    device = BTDevice.fromJson(json.decode(prefs.getString("pref_device")));
    _textEditingController.text = device.name;
  }
}
