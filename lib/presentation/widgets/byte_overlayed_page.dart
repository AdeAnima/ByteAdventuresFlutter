import 'package:byte_adventures/presentation/widgets/page_header.dart';
import 'package:flutter/material.dart';

class Overlaydefinition {
  final Alignment? alignment;
  final Opacity? opacity;
  final double? width;
  final double? height;

  Overlaydefinition({this.alignment, this.opacity, this.width, this.height});
}

class ByteOverlayedPage extends StatelessWidget {
  final String? pageName;
  final Widget pageContent;
  final Overlaydefinition? mascotOverlay;
  final Overlaydefinition? socialIconsOverlay;

  const ByteOverlayedPage({
    required this.pageContent,
    this.mascotOverlay,
    this.socialIconsOverlay,
    this.pageName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1080),
        child: Column(
          children: [
            if (pageName != null) ...[PageHeader(text: pageName!)] else Container(),
            SizedBox(child: pageContent),
            if (socialIconsOverlay != null) const SizedBox(height: 62) else Container(),
          ],
        ),
      );
}
