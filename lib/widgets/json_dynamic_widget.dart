import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/widget_factory.dart';
import '../providers/widget_provider.dart';

class JsonDynamicWidget extends StatelessWidget {
  const JsonDynamicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final jsonMap = context.watch<WidgetProvider>().jsonMap;
    return buildWidget(jsonMap);
  }
}
