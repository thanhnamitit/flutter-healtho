import 'package:flutter/material.dart';

class PureInkWell extends StatelessWidget {
  final Function onTap;
  final Widget child;

  PureInkWell({this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: this.child,
    );
  }
}
