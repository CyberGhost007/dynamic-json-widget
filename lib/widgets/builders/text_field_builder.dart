import 'package:flutter/material.dart';
import 'widget_builder.dart';

class TextFieldBuilder extends WidgetBuilderBase {
  @override
  Widget build(Map<String, dynamic> json) {
    return TextField(
      decoration: InputDecoration(
        labelText: json['labelText'] ?? '',
        hintText: json['hintText'] ?? '',
        border: json['border'] == 'outline'
            ? const OutlineInputBorder()
            : const UnderlineInputBorder(),
      ),
    );
  }
}
