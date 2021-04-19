import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global.dart' as global;

class Searching extends StatefulWidget {
  @override
  _SearchingState createState() => _SearchingState();
}

class BTDevice {
  var _name;
  var _MAC;
  var _connected;

  BTDevice(this._name) {
    _connected = false;
    _MAC = _getRandomAddress();
  }

  get name => _name;

  get MAC => _MAC;

  get connected => _connected;

  set connected(value) {
    _connected = value;
  }

  String _getRandomAddress() {
    Random random = new Random();
    String string = "";
    for (int i = 0; i < 6; ++i)
      string +=
          random.nextInt(256).toRadixString(16).padLeft(2, '0').toUpperCase() +
              (i != 5 ? ":" : "");

    return string;
  }

  BTDevice.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _MAC = json['mac'];

  Map<String, dynamic> toJson() => {
        'name': _name,
        'mac': _MAC,
      };
}

class _SearchingState extends State<Searching> {
  List<BTDevice> _devices = List<BTDevice>.generate(
      10, (index) => BTDevice("Device #${(new Random()).nextInt(1000)}"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan for Bluetooth devices"),
      ),
      body: new RefreshIndicator(
        child: new ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: _devices.length,
            itemBuilder: (context, i) {
              return _buildRow(_devices[i]);
            }),
        onRefresh: _handleRefresh,
      ),
    );
  }

  Widget _buildRow(BTDevice device) {
    return ListTile(
      title: Text(device.name),
      subtitle: Text(device.MAC),
      trailing: (RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        color: Colors.grey,
        child: Text(device.connected ? "Disconnect" : "Connect"),
        onPressed: () {
          _onPressed(device);
        },
      )),
      onTap: () {
        _onPressed(device);
      },
    );
  }

  void _onPressed(BTDevice device) async {
    setState(() {
      device.connected = !device.connected;
      print("Pressed: " + device.name);
    });

    if (device.connected) {
      var prefs = await SharedPreferences.getInstance();
      await prefs.setString("pref_device", device.toJson().toString());
    }

    global.quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'action',
          localizedTitle: "BTDevice" /*+ device.name*/,
          icon: 'ic_launcher'),
    ]).then((value) {
      setState(() {});
    });
  }

  List<BTDevice> _createDevicesList() {
    return List<BTDevice>.generate(
        10, (index) => BTDevice("Device #${(new Random()).nextInt(1000)}"));
  }

  Future<void> _handleRefresh() async {
    setState(() {
      _devices.clear();
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _devices = _createDevicesList();
    });
  }
}
