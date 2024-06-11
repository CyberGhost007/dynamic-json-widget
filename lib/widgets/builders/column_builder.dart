import 'package:flutter/material.dart';
import 'widget_builder.dart';
import '../widget_factory.dart';

class ColumnBuilder extends WidgetBuilderBase {
  @override
  Widget build(Map<String, dynamic> json) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: (json['children'] as List)
          .map((childJson) => buildWidget(childJson))
          .toList(),
    );
  }
}
