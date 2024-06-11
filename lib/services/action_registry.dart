import 'action_handler.dart';

class ActionRegistry {
  final Map<RegExp, ActionHandler> _actionHandlers = {};

  void registerActionHandler(RegExp pattern, ActionHandler handler) {
    _actionHandlers[pattern] = handler;
  }

  ActionHandler? getActionHandler(String action) {
    for (var entry in _actionHandlers.entries) {
      if (entry.key.hasMatch(action)) {
        return entry.value;
      }
    }
    return null;
  }
}
