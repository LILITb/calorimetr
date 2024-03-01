import 'package:flutter/material.dart';

class Calories extends StatefulWidget {
  const Calories({super.key});

  @override
  State<Calories> createState() => _CaloriesState();
}

class _CaloriesState extends State<Calories> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Calories',
            style: theme.textTheme.titleMedium,
          ),
          Text(
            'Remaining = Goal-Food+Exercise',
            style: theme.textTheme.titleSmall,
          ),
          const Row(
            children: [],
          )
        ],
      ),
    );
  }
}
