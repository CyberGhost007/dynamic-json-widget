import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/action_registry.dart';
import 'widget_builder.dart';

class ButtonBuilder extends WidgetBuilderBase {
  @override
  Widget build(Map<String, dynamic> json) {
    return Builder(
      builder: (context) => ElevatedButton(
        onPressed: () {
          if (json.containsKey('actionString')) {
            final actionUri = Uri.parse(json['actionString']);
            final actionRegistry =
                Provider.of<ActionRegistry>(context, listen: false);
            final actionHandler =
                actionRegistry.getActionHandler(actionUri.path);
            if (actionHandler != null) {
              actionHandler.handleAction(
                  context, actionUri, json['extras'], null);
            }
          }
        },
        child: Text(json['text'] ?? 'Button'),
      ),
    );
  }
}
