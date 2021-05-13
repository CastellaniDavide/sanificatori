import 'dart:math';

import 'package:sanificatori/global.dart' as global;
import 'package:sanificatori/model/BTDevice.dart';
import 'package:stacked/stacked.dart';

class SearchingViewModel extends MultipleFutureViewModel {
  static const SCAN_RESULT_FUNC = "SCAN_RESULT_FUNC";

  List<BTDevice> devices = [];

  @override
  Map<String, Future Function()> get futuresMap =>
      {SCAN_RESULT_FUNC: scanDevices};

  List<BTDevice> createDevicesList() {
    return List<BTDevice>.generate(
        10, (index) => BTDevice("Device #${(new Random()).nextInt(1000)}"));
  }

  void connectToDevice(BTDevice device) async {
    device.connected = !device.connected;
    print("Pressed: " + device.name);

    if (device.connected) {
      global.sDevice(device);
    }

    global.changeAction(device.name);
  }

  Future<void> scanDevices() async {
    devices = [];

    await Future.delayed(Duration(seconds: 2));

    devices = createDevicesList();
  }
}
