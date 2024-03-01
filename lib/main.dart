import 'package:caloriegram/ui/theme/theme.dart';
import 'package:caloriegram/utils/utils.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const CalormetrApp());
}

class CalormetrApp extends StatefulWidget {
  const CalormetrApp({super.key});

  @override
  State<CalormetrApp> createState() => _CalormetrAppState();
}

class _CalormetrAppState extends State<CalormetrApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Caloriegram',
      theme: caloryTheme,
    );
  }
}
