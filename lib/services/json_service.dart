import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../providers/widget_provider.dart';

class JsonService {
  Future<void> loadJsonFromAsset(BuildContext context, String assetPath) async {
    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final jsonMap = json.decode(jsonString);
      if (jsonMap == null) {
        throw Exception('Failed to decode JSON: Decoded JSON is null');
      }
      final provider = WidgetProvider.of();
      provider.updateJson(jsonMap);
    } catch (error) {
      throw Exception('Failed to load JSON from asset: $error');
    }
  }

  Future<void> loadJsonFromString(
      BuildContext context, String jsonString) async {
    try {
      final jsonMap = json.decode(jsonString);

      WidgetProvider.of().updateJson(jsonMap);
    } catch (error) {
      throw Exception('Failed to load JSON from string: $error');
    }
  }

  Future<void> loadJsonFromNetwork(BuildContext context, String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonMap = json.decode(response.body);
        WidgetProvider.of().updateJson(jsonMap);
      } else {
        throw Exception(
            'Failed to load JSON from network: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to load JSON from network: $error');
    }
  }
}
