import 'package:flutter/material.dart';

class SavesCard extends StatefulWidget {
  const SavesCard(
    this.name,
    this.calories,
    this.created, {
    super.key,
  });
  final String name;
  final String created;
  final int calories;
  @override
  State<SavesCard> createState() => _SavesCardState();
}

class _SavesCardState extends State<SavesCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 122,
      child: Row(
        children: [Text(widget.name)],
      ),
    );
  }
}
