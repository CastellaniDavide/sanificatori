import 'package:flutter/material.dart';

class Device extends StatefulWidget {
  @override
  _DeviceState createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Device"),
        ),
        body: Text("Device"));
  }

  /*Future<BTDevice> getDevice() async {
    var prefs = await SharedPreferences.getInstance();
    BTDevice.fromJson(jsonDecode(prefs.getString("pref_device")));
  }*/
}
