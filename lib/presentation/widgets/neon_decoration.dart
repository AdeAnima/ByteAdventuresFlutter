import 'package:byte_adventures/presentation/widgets/neon_glow_shadow.dart';
import 'package:flutter/material.dart';

class NeonDecoration {
  static Decoration neonDecorationImage(BuildContext context, {DecorationImage? decorationImage}) => BoxDecoration(
        image: decorationImage,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: NeonGlowShadow.themeGlow(context),
        border: Border.all(
          color: Theme.of(context).accentColor,
          width: 2,
        ),
      );

  static Decoration neonDecorationColor(BuildContext context, {Color? decorationColor}) => BoxDecoration(
        color: decorationColor ?? Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: NeonGlowShadow.themeGlow(context),
        border: Border.all(
          color: Theme.of(context).accentColor,
          width: 2,
        ),
      );
}
