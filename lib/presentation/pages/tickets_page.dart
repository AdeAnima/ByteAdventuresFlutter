import 'package:byte_adventures/infrastructure/helpers.dart';
import 'package:byte_adventures/presentation/widgets/byte_overlayed_page.dart';
import 'package:byte_adventures/presentation/widgets/embeded_i_frame.dart';
import 'package:byte_adventures/presentation/widgets/neon_decoration.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ByteOverlayedPage(
        pageName: 'JOIN B8+',
        socialIconsOverlay: Overlaydefinition(),
        pageContent: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (MediaQuery.of(context).size.width > 700) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Choose your path to join B8+ 2021',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.headline5,
                          text: 'Contact us on our ',
                          children: [
                            TextSpan(
                              text: 'DiscordServer',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  openURL('https://discord.gg/grpBnjRfP8');
                                },
                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Theme.of(context).accentColor,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                            const TextSpan(text: ' to contribute and get rewards.')
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                'or get your ticket here',
                style: Theme.of(context).textTheme.headline5,
              ),
            ] else
              Container(),
            if (MediaQuery.of(context).size.width > 700)
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [TicketsWidget()])
            else
              const Flexible(child: TicketsWidget()),
            const SizedBox()
          ],
        ),
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
