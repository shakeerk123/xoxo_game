import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  final List<Shadow> shadows;
  final String text;
  final double fontSize;
  const AnimatedText(
      {super.key,
      required this.shadows,
      required this.text,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          shadows: shadows,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(text, speed: const Duration(milliseconds: 300)),
          ],
        ),
      ),
    );
  }
}
