import 'package:flutter/material.dart';
import 'package:value_notifier_studies/src/app_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const AppWidget();
  }
}
