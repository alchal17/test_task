import 'package:flutter/material.dart';
import 'package:test_task/di/injection_container.dart';
import 'package:test_task/view/screens/home_screen.dart';

void main() {
  setupDependencyContainer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
