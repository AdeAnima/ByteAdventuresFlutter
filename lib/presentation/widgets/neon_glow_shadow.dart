import 'dart:math';

import 'package:flutter/material.dart';

class NeonGlowShadow {
  static List<BoxShadow> themeGlow(BuildContext context) {
    final color1 = Theme.of(context).accentColor;
    final color2 = Theme.of(context).buttonColor;
    return _getBoxShadows(color1, color2);
  }

  static List<BoxShadow> glowFromColors(Color color1, Color color2) => _getBoxShadows(color1, color2);

  static List<BoxShadow> _getBoxShadows(Color color1, Color color2) => [
        BoxShadow(
          color: color1.withOpacity(0.6),
          spreadRadius: 1,
          blurRadius: Random(16).nextDouble() * 8 + 8,
          offset: const Offset(-8, 0),
        ),
        BoxShadow(
          color: color2.withOpacity(0.6),
          spreadRadius: 1,
          blurRadius: Random(16).nextDouble() * 8 + 8,
          offset: const Offset(8, 0),
        ),
        BoxShadow(
          color: color1.withOpacity(0.2),
          spreadRadius: 8,
          blurRadius: Random(16).nextDouble() * 16 + 8,
          offset: const Offset(-8, 0),
        ),
        BoxShadow(
          color: color2.withOpacity(0.2),
          spreadRadius: 8,
          blurRadius: Random(16).nextDouble() * 16 + 8,
          offset: const Offset(8, 0),
        )
      ]..shuffle(Random());
}
