import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sanificatori/global.dart' as global;
import 'package:sanificatori/model/BTDevice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class DeviceViewModel extends MultipleFutureViewModel {
  static const GET_DEVICE_FUNC = "GET_DEVICE_FUNC";

  BTDevice device = new BTDevice("");
  TextEditingController textEditingController =
      new TextEditingController(text: "");

  @override
  Map<String, Future Function()> get futuresMap => {GET_DEVICE_FUNC: getDevice};

  saveDevice() {
    device.name = textEditingController.text;
    global.sDevice(device);
    global.changeAction(textEditingController.text);
  }

  getDevice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    device = BTDevice.fromJson(json.decode(prefs.getString("pref_device")));
    textEditingController.text = device.name;
  }
}
