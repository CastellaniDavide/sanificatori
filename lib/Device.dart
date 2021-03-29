import 'package:flutter/material.dart';

class Device extends StatefulWidget {
  @override
  _DeviceState createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Text("Device")
    );
  }
}
