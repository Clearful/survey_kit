import 'package:flutter/material.dart';

void unfocusKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

class KeyboardDismisser extends StatelessWidget {
  const KeyboardDismisser({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => unfocusKeyboard(),
      child: child,
    );
  }
}
