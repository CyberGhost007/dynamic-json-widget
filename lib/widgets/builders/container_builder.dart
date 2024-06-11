import 'package:flutter/material.dart';
import '../../utils/color_parser.dart';
import '../widget_factory.dart';
import 'widget_builder.dart';

class ContainerBuilder extends WidgetBuilderBase {
  @override
  Widget build(Map<String, dynamic> json) {
    return Container(
      padding: EdgeInsets.all(json['padding']?.toDouble() ?? 0),
      color: parseColor(json['color']),
      child: json['child'] != null ? buildWidget(json['child']) : null,
    );
  }
}
