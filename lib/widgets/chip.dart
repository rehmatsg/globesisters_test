import 'package:flutter/material.dart';

class NewChip extends StatefulWidget {

  NewChip({
    Key? key,
    required this.icon,
    required this.text
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  State<NewChip> createState() => _NewChipState();
}

class _NewChipState extends State<NewChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).dividerColor,
            blurRadius: 1,
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.icon,
            size: 15,
          ),
          SizedBox(width: 4),
          Text(
            widget.text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer
            ),
          ),
        ],
      ),
    );
  }
}