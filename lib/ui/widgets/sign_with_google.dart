import 'package:flutter/material.dart';

class SignWithGoogle extends StatefulWidget {
  const SignWithGoogle({super.key});

  @override
  State<SignWithGoogle> createState() => _SignWithGoogleState();
}

class _SignWithGoogleState extends State<SignWithGoogle> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 40),
      height: 130,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                'or'.toUpperCase(),
                style: theme.textTheme.bodyLarge,
              ),
            ),
            InkWell(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(12)),
              height: 56,
              child: const Row(
                  children: [ImageIcon(AssetImage('assets/icons/g.png'))]),
            ))
          ]),
    );
  }
}
