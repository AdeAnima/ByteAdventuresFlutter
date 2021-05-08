import 'package:byte_adventures/presentation/widgets/byte_overlayed_page.dart';
import 'package:byte_adventures/presentation/widgets/embeded_i_frame.dart';
import 'package:byte_adventures/presentation/widgets/neon_decoration.dart';
import 'package:flutter/material.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ByteOverlayedPage(
        pageName: 'JOIN B8+',
        socialIconsOverlay: Overlaydefinition(),
        pageContent: MediaQuery.of(context).size.width > 700
            ? Row(mainAxisAlignment: MainAxisAlignment.center, children: const [TicketsWidget()])
            : const TicketsWidget(),
      );
}

class TicketsWidget extends StatelessWidget {
  const TicketsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width > 400 ? 48.0 : 20, vertical: 10),
        decoration: NeonDecoration.neonDecorationColor(context, decorationColor: Colors.white),
        child: const Iframe(
          iframeUrl: 'https://tickets.byte-adventures.com/',
          iframeHeight: 485,
          iframeWidth: 700,
        ),
      );
}
