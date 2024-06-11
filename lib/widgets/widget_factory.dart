import 'package:flutter/material.dart';
import 'builders/container_builder.dart';
import 'builders/text_builder.dart';
import 'builders/text_field_builder.dart';
import 'builders/button_builder.dart';
import 'builders/column_builder.dart';
import 'builders/row_builder.dart';
import 'builders/widget_builder.dart';

Map<String, WidgetBuilderBase> widgetBuilders = {
  'Container': ContainerBuilder(),
  'Text': TextBuilder(),
  'TextField': TextFieldBuilder(),
  'Button': ButtonBuilder(),
  'Column': ColumnBuilder(),
  'Row': RowBuilder(),
  // Add other widget builders here
};

Widget buildWidget(Map<String, dynamic>? json) {
  if (json == null || !json.containsKey('widget')) return Container();

  String widgetType = json['widget'];
  WidgetBuilderBase? builder = widgetBuilders[widgetType];

  if (builder != null) {
    return builder.build(json);
  } else {
    return Container();
  }
}
