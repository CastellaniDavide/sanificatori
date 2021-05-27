import 'dart:convert';

import 'package:sanificatori/global.dart' as global;
import 'package:sanificatori/model/BTDevice.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class DeviceViewModel extends MultipleFutureViewModel {
  static const GET_DEVICE_FUNC = "GET_DEVICE_FUNC";

  BTDevice device = new BTDevice("");

  @override
  Map<String, Future Function()> get futuresMap => {GET_DEVICE_FUNC: getDevice};

  saveDevice(String newName) {
    device.name = newName;
    global.sDevice(device);
    global.changeAction(newName);
  }

  Future<String> getDevice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    device = BTDevice.fromJson(json.decode(prefs.getString("pref_device")));
    return device.name;
  }
}
