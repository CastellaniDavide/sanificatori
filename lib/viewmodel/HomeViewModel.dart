import 'package:sanificatori/global.dart' as global;
import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
  init() {
    global.quickActions.initialize((String shortcutType) {
      if (shortcutType == "action") {
        setIndex(1);
      }
    });
  }
}
