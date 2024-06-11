import 'package:flutter/material.dart';
import '../../utils/color_parser.dart';
import 'widget_builder.dart';

class TextBuilder extends WidgetBuilderBase {
  @override
  Widget build(Map<String, dynamic> json) {
    return Text(
      json['data'],
      style: TextStyle(
        fontSize: json['style']?['fontSize']?.toDouble() ?? 14,
        color: parseColor(json['style']?['color'] ?? '#000000'),
      ),
    );
  }
}
