import 'dart:convert';

import 'package:quick_actions/quick_actions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Searching.dart';

// set default values for the initial run
QuickActions quickActions = QuickActions();
bool debug = true;

void sDevice(BTDevice device) async {
  var prefs = await SharedPreferences.getInstance();
  await prefs.setString("pref_device", jsonEncode(device.toJson()));
}

void changeAction(String name) {
  quickActions.setShortcutItems(<ShortcutItem>[
    ShortcutItem(
        type: 'action', localizedTitle: name ?? "unknown", icon: 'ic_launcher'),
  ]);
}
