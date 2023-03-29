# CarouselView


```

import 'package:flutter/material.dart';

enum ButtonType {
  filled,
  bordered,
}

extension ButtonTypeExtension on ButtonType {
  Color getBackgroundColor(Color color, ButtonState state) {
    if (state == ButtonState.disabled) {
      return const Color.fromARGB(255, 212, 212, 212);
    } else {
      switch (this) {
        case ButtonType.filled:
          return color;
        default:
          return Colors.transparent;
      }
    }
  }

  Color getForegroundColor(Color color, ButtonState state) {
    if (state == ButtonState.disabled) {
      return Colors.grey.shade500;
    } else {
      switch (this) {
        case ButtonType.bordered:
          return color;
        default:
          return Colors.white;
      }
    }
  }
}

enum ButtonState {
  enabled,
  disabled,
  loading,
}

class AppButton extends StatelessWidget {
  final Color color;
  final ButtonType buttonType;
  final ButtonState buttonState;
  final String text;
  final double height;
  final double width;
  final bool isRounded;
  final VoidCallback onPressed;

  const AppButton({
    super.key,
    this.buttonState = ButtonState.enabled,
    this.width = 0.0,
    this.height = 50.0,
    this.isRounded = true,
    required this.buttonType,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
          color: buttonType.getBackgroundColor(color, buttonState),
          border: Border.all(
              color: buttonType == ButtonType.filled
                  ? buttonType.getBackgroundColor(color, buttonState)
                  : buttonType.getForegroundColor(color, buttonState),
              width: 2.5),
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.height / 2)),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: buttonType.getForegroundColor(color, buttonState))),
      ),
    );
  }
}



```
