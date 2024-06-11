import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/action_registry.dart';
import 'services/json_service.dart';
import 'providers/widget_provider.dart';
import 'services/snackbar_action_handler.dart';
import 'utils/consts.dart';
import 'widgets/json_dynamic_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WidgetProvider()),
        Provider<ActionRegistry>(
          create: (_) {
            var registry = ActionRegistry();
            registry.registerActionHandler(
                RegExp(r'(^/?showSnackbar/?$)'), SnackBarActionHandler());
            return registry;
          },
        ),
      ],
      child: MaterialApp(
        navigatorKey: Constants.navigatorKey,
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final JsonService jsonService = JsonService();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dynamic Widget Rendering')),
      body: const Center(child: JsonDynamicWidget()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _loadJson(context),
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _loadJson(BuildContext context) {
    jsonService
        .loadJsonFromAsset(context, 'assets/example.json')
        .catchError((error) {
      log("Error loading JSON: $error");
    });
  }
}
