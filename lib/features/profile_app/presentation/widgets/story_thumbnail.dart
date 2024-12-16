import 'package:flutter/material.dart';

class StoryThumbnail extends StatelessWidget {
  final String url;

  const StoryThumbnail({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(children: [
        Container(
          width: 70,
          height: 90,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(url),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 40),
      ]),
    );
  }
}
