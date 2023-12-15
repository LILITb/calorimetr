import 'package:caloriegram/constants/theme/theme.dart';
import 'package:caloriegram/utils/routes/routes.dart';
import 'package:caloriegram/views/accounted_sceens/login_screen.dart';
import 'package:flutter/material.dart';

import 'views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: Routes.generateRoute() ,
      debugShowCheckedModeBanner: false,
        title: 'Caloriegram', theme: caloryTheme, home:const LoginScreen());
  }
}

class MyApp1 extends StatefulWidget {
  const MyApp1({super.key});

  @override
  State<MyApp1> createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('gggggggggggggg'),
        ),
        body: Column(
          children: [
            const TextField(
            ),
            ElevatedButton(
              onPressed: () {},
              child:const Text(
                'hello',
              ),
            ),
          ],
        ));
  }
}
