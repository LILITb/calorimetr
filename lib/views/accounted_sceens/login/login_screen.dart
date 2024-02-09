import 'package:caloriegram/utils/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../ui/widgets/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Text(
                'Sign in',
                style: theme.textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 25,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'abc@email.com',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Your password',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                              value: remember,
                              onChanged: (value) {
                                setState(() {
                                  remember = value;
                                });
                              }),
                        ),
                        Text(
                          'Remember Me',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, RoutesName.ressetPassword),
                    child: Text(
                      'Forgot Password?',
                      style: theme.textTheme.bodySmall,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width, 58))),
                onPressed: () {},
                child: Text(
                  'Sign in'.toUpperCase(),
                ),
              ),
              const SignWithGoogle()
            ]),
      ),
    ));
  }
}
