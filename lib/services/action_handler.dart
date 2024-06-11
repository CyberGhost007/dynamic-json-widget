import 'package:flutter/material.dart';

typedef OnHandledAction = void Function();

abstract class ActionHandler {
  void handleAction(BuildContext? context, Uri action,
      Map<String, dynamic>? extras, OnHandledAction? onHandledAction);
}
