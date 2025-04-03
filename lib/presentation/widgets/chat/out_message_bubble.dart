import 'package:flutter/material.dart';

class OutMessageBubble extends StatelessWidget {
  final String message;
  const OutMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(message, style: TextStyle(color: Colors.white)),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
