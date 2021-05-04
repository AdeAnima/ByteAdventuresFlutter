import 'package:flutter/material.dart';

class Overlaydefinition {
  final Alignment alignment;
  final Opacity opacity;
  final double width;
  final double height;

  Overlaydefinition(this.alignment, this.opacity, this.width, this.height);
}

class ByteOverlayedPage extends StatelessWidget {
  final Overlaydefinition mascotOverlay;
  final Overlaydefinition socialIconsOverlay;
  final Widget child;

  const ByteOverlayedPage({
    required this.mascotOverlay,
    required this.socialIconsOverlay,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => child;
}
