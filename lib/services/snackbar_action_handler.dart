import 'package:flutter/material.dart';
import 'action_handler.dart';

class SnackBarActionHandler extends ActionHandler {
  @override
  void handleAction(BuildContext? context, Uri action,
      Map<String, dynamic>? extras, OnHandledAction? onHandledAction) {
    if (context != null && extras != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(extras['message'] ?? 'No message provided')),
      );
    }
    onHandledAction?.call();
  }
}
