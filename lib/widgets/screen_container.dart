import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ScreenContainer extends StatelessWidget {
  final Widget child;

  const ScreenContainer({required this.child});

  bool get hasSmallScreen => (defaultTargetPlatform == TargetPlatform.android) || (defaultTargetPlatform == TargetPlatform.iOS);

  @override
  Widget build(BuildContext context) => hasSmallScreen ? SmallScreenContainer(child) : BigScreenContainer(child, Colors.black);
}

class BigScreenContainer extends StatelessWidget {
  final Widget child;
  final Color color;

  const BigScreenContainer(this.child, this.color);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double canvasWidth = constraints.maxHeight / 1.77;
      final double paddingWidth = ((constraints.maxWidth - canvasWidth) / 2) + 1;

      return Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: constraints.maxHeight,
              width: canvasWidth,
              child: child,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: max(paddingWidth, 0),
              color: color,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: max(paddingWidth, 0),
              color: color,
            ),
          ),
        ],
      );
    });
  }
}

class SmallScreenContainer extends StatelessWidget {
  final Widget child;

  const SmallScreenContainer(this.child);

  @override
  Widget build(BuildContext context) => child;
}
