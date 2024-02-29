import 'package:flutter/material.dart';

class StepViewTitle extends StatelessWidget {
  const StepViewTitle(this.text, {this.style, this.textAlign, super.key});

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
