import 'package:flutter/material.dart';

class FullWidthBtn extends StatelessWidget {
  const FullWidthBtn({this.onPressed, required this.child, super.key});

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final buttonWidth = width - 40.0;
    const buttonHeight = 48.0;
    final size = Size(buttonWidth, buttonHeight);

    return FilledButton(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        // splashFactory: InkRipple.splashFactory,
        fixedSize: size,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
