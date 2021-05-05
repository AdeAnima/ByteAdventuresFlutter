import 'package:byte_adventures/presentation/widgets/byte_overlayed_page.dart';
import 'package:byte_adventures/presentation/widgets/embeded_i_frame.dart';
import 'package:byte_adventures/presentation/widgets/neon_decoration.dart';
import 'package:flutter/material.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ByteOverlayedPage(
        pageName: 'Tickets',
        socialIconsOverlay: Overlaydefinition(),
        pageContent: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30.0),
          constraints: const BoxConstraints(maxWidth: 900, maxHeight: 700),
          decoration: NeonDecoration.neonDecorationColor(context, decorationColor: Colors.white),
          child: const Iframe(iframeUrl: 'https://tickets.byte-adventures.com/'),
        ),
      );
}
