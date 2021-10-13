import 'package:flutter/material.dart';

class StrokedText extends StatelessWidget {
  final String name;

  const StrokedText(this.name);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.headline5?.copyWith(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1
                ..color = Colors.black),
        ),
        Text(
          name,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.white),
        )
      ],
    );
  }
}
