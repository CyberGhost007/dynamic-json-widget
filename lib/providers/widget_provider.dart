import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/consts.dart';

class WidgetProvider with ChangeNotifier {
  Map<String, dynamic> _jsonMap = {};

  Map<String, dynamic> get jsonMap => _jsonMap;

  void updateJson(Map<String, dynamic> json) {
    _jsonMap = json;
    notifyListeners();
  }

  static WidgetProvider of({bool listen = false}) =>
      Provider.of<WidgetProvider>(
        Constants.navigatorKey.currentContext!,
        listen: listen,
      );
}
