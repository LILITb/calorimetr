import 'package:flutter/material.dart';

import '../../../ui/ui.dart';
import '../../../utils/utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(
              'Sign up',
              style: theme.textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 25,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Full name',
                prefixIcon: Icon(Icons.person_outlined),
              ),
            ),
            const SizedBox(
              height: 20,
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
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm password',
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: Icon(Icons.visibility_off_outlined),
              ),
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
                'Sign up'.toUpperCase(),
              ),
            ),
            const SignWithGoogle(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?   ',
                    style: theme.textTheme.headlineSmall!
                        .copyWith(fontStyle: FontStyle.italic),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, RoutesName.login),
                    child: Text(
                      'Signin',
                      style: theme.textTheme.headlineSmall!
                          .copyWith(color: AppColors.appThemeColor),
                    ),
                  ),
                ],
              ),
            )
          ]),
    ));
  }
}
