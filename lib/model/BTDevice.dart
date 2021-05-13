import 'dart:math';

class BTDevice {
  var _name;
  var _MAC;
  var _connected;

  BTDevice(this._name) {
    _connected = false;
    _MAC = _getRandomAddress();
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

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
