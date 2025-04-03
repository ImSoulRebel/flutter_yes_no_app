import 'package:flutter/material.dart';
import 'package:flutter_yes_no_app/domain/entities/message.dart';

class InMessageBubble extends StatelessWidget {
  final Message message;
  const InMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(message.text, style: TextStyle(color: Colors.white)),
              if (message.imageUrl != null)
                _ImageBubble(image: message.imageUrl!),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String image;
  const _ImageBubble({required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        image,
        alignment: Alignment.centerLeft,
        height: size.height * 0.25,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            height: size.height * 0.25,
            child: const Center(child: Text('Loading meme image')),
          );
        },
      ),
    );
  }
}
