import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Style {
  TextStyle onBoardingTitle({Color textColor = Colors.black}) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: textColor,
    );
  }

  TextStyle onBoardingMessage({Color textColor = Colors.black}) {
    return TextStyle(
      fontSize: 14,
      color: textColor,
    );
  }

  TextStyle homeItemTitle({
    Color textColor = Colors.black,
    double fontSize = 16,
  }) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      color: textColor,
    );
  }

  TextStyle homeItemContent({double fontSize = 14}) {
    return TextStyle(
      fontSize: fontSize,
      color: Color(0xff343334),
    );
  }
}
