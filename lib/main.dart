import 'package:caloriegram/ui/theme/theme.dart';
import 'package:caloriegram/utils/routes/routes.dart';
import 'package:flutter/material.dart';

import 'utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
