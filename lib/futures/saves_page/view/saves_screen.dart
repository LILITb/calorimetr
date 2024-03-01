import 'package:caloriegram/ui/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../models/saves_model.dart';
import '../widget/widget.dart';

class SavesScreen extends StatefulWidget {
  const SavesScreen({super.key});

  @override
  State<SavesScreen> createState() => _SavesScreenScreenState();
}

final List<Saves> saves = <Saves>[
  Saves("Cesar", '10.08.2023', 36),
  Saves("Cesar", '10.08.2023', 78),
  Saves("Stolichnii", '10.08.2023', 54),
  Saves("Cesar", '10.08.2023', 36),
];

class _SavesScreenScreenState extends State<SavesScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: AppColors.whiteBody,
      child: CustomScrollView(slivers: [
        const SliverAppBar(
          automaticallyImplyLeading: false,
          title: Text('Saves'),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 400,
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: saves.length,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final saved = saves[index];
                return Card(
                  color: AppColors.cardGrey,
                  child: SavesCard(
                    saved.name,
                    saved.calories,
                    saved.createBy,
                  ),
                );
              },
            ),
          ),
        )
      ]),
    );
  }
}
