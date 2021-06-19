import 'dart:io';

import 'package:byte_adventures/infrastructure/helpers.dart';
import 'package:byte_adventures/presentation/widgets/byte_overlayed_page.dart';
import 'package:byte_adventures/presentation/widgets/neon_decoration.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AboutTheConferenceMobile1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ByteOverlayedPage(
        pageName: 'About B8+',
        socialIconsOverlay: Overlaydefinition(),
        pageContent: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              AboutConferenceIntroText(textScaleFactor: 0.7),
              MoreAbout(textScaleFactor: 0.9),
            ],
          ),
        ),
      );
}

class AboutTheConferenceMobile2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final definitionWidth = MediaQuery.of(context).size.width * 0.9;
    return ByteOverlayedPage(
      pageName: 'Focus for B8+ 2021',
      socialIconsOverlay: Overlaydefinition(),
      pageContent: Scrollbar(
        isAlwaysShown: true,
        child: PageView(
          children: [
            DetailsWrapper(
              width: definitionWidth,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                child: DigitalNativeDetail(textScaleFactor: 0.8),
              ),
            ),
            DetailsWrapper(
              width: definitionWidth,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                child: ExcitementDetail(textScaleFactor: 0.8),
              ),
            ),
            DetailsWrapper(
              width: definitionWidth,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                child: CommunityDetail(textScaleFactor: 0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutTheConferenceDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.of(context).size.width;
    const wrapWidth = 1180 - 80;
    final definitionWidth = windowWidth > 740 ? wrapWidth / 3 - (3 * 40) : wrapWidth * 0.9;

    return ByteOverlayedPage(
      pageName: 'About B8+',
      socialIconsOverlay: Overlaydefinition(),
      pageContent: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const FractionallySizedBox(widthFactor: 0.7, child: AboutConferenceIntroText()),
          Row(
            children: [
              Flexible(
                child: Column(
                  children: [
                    Text(
                      'Focus for B8+ 2021',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DetailsWrapper(
                          width: definitionWidth,
                          child: const DigitalNativeDetail(),
                        ),
                        DetailsWrapper(
                          width: definitionWidth,
                          child: const ExcitementDetail(),
                        ),
                        DetailsWrapper(
                          width: definitionWidth,
                          child: const CommunityDetail(),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const FractionallySizedBox(widthFactor: 0.7, child: MoreAbout()),
        ],
      ),
    );
  }
}

class MoreAbout extends StatelessWidget {
  final double textScaleFactor;

  const MoreAbout({this.textScaleFactor = 1.0, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: RichText(
                textAlign: TextAlign.center,
                textScaleFactor: textScaleFactor,
                text: TextSpan(
                  style: Theme.of(context).textTheme.caption,
                  text: 'Here you can find our ',
                  children: [
                    TextSpan(
                      text: 'CodeOfConduct',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          openURL(
                              'https://docs.google.com/document/d/e/2PACX-1vQ36b4cr0KSsWI7MXMeYFhDVLnC4ban-NSs26-kghZCFbtldD0uOZ6itjlzEJVmn0MTJFgYDObbgrNe/pub');
                        },
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).accentColor,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    const TextSpan(text: ', '),
                    TextSpan(
                      text: 'DataProtection',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          openURL('https://www.sparket.net/datenschutz.html');
                        },
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).accentColor,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Impressum',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          openURL('https://www.sparket.net/impressum.html');
                        },
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).accentColor,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}

class CommunityDetail extends StatelessWidget {
  final double textScaleFactor;
  const CommunityDetail({
    this.textScaleFactor = 1.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ByteAdventuresDetails(
        headerWidget: Image.network(
          'https://media.giphy.com/media/Fo5y4K3GD3RYijvsCS/giphy.gif',
          fit: BoxFit.contain,
        ),
        headerText: 'Community',
        bodyWidget: RichText(
          textScaleFactor: textScaleFactor,
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyText1,
            text:
                'Coming together once a year is nice but we want to build a community to exchange, meet and have fun together with. Join our ',
            children: [
              TextSpan(
                text: 'DiscordServer',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    openURL('https://discord.gg/grpBnjRfP8');
                  },
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).accentColor,
                      decoration: TextDecoration.underline,
                    ),
              ),
              const TextSpan(text: ' get in touch with us.')
            ],
          ),
        ),
      );
}

class ExcitementDetail extends StatelessWidget {
  final double textScaleFactor;
  const ExcitementDetail({
    this.textScaleFactor = 1.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ByteAdventuresDetails(
        headerWidget: Image.network(
          'https://media.giphy.com/media/xTiN0CNHgoRf1Ha7CM/giphy.gif',
          fit: BoxFit.cover,
        ),
        headerText: 'Excitement 1st',
        bodyWidget: RichText(
          textScaleFactor: textScaleFactor,
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyText1,
            text:
                '@B8+ the most important criteria to participate is to be excited for your topic. We believe no matter your background your excitement for a topic should be the main thing to do something.',
            children: [
              TextSpan(
                text: '\nBusiness value, experience and everything else is secondary.',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    openURL(
                        'https://github.com/AdeAnima/ByteAdventuresFlutter/wiki/Manifest#passion-is-key-not-business-value');
                  },
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Theme.of(context).accentColor,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ],
          ),
        ),
      );
}

class DigitalNativeDetail extends StatelessWidget {
  final double textScaleFactor;
  const DigitalNativeDetail({
    this.textScaleFactor = 1.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ByteAdventuresDetails(
        headerWidget: const VideoWidget(
          source: 'https://gather.town/images/site/landing_demo.mp4',
          loop: true,
        ),
        headerText: 'Digital native',
        bodyWidget: RichText(
          textScaleFactor: textScaleFactor,
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyText1,
            text: 'We saw going fully online as chance to achieve one of our core goals; ',
            children: [
              TextSpan(
                text: '\nTo enable everyone\'s potential.',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    openURL(
                        'https://github.com/AdeAnima/ByteAdventuresFlutter/wiki/Manifest#enable-everyones-potential');
                  },
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Theme.of(context).accentColor, decoration: TextDecoration.underline),
              ),
              const TextSpan(
                text: ' @B8+ anyone can get together, meet new people and learn in our ',
              ),
              TextSpan(
                text: 'digital world',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    openURL('https://gather.byte-adventures.com/');
                  },
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Theme.of(context).accentColor, decoration: TextDecoration.underline),
              ),
              const TextSpan(text: '. No matter your financial situation, location o experience everyone is welcome.')
            ],
          ),
        ),
      );
}

class AboutConferenceIntroText extends StatelessWidget {
  final double textScaleFactor;

  const AboutConferenceIntroText({this.textScaleFactor = 1.0, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            'ByteAdventures is meant to be more than just a conference, but a community for Geeks and Nerds like us, that want to share their excitement and are eager to discover new things.',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
            textScaleFactor: textScaleFactor,
          ),
          const SizedBox(height: 8.0),
          RichText(
            maxLines: 2,
            textAlign: TextAlign.center,
            textScaleFactor: textScaleFactor,
            text: TextSpan(
              style: Theme.of(context).textTheme.headline6,
              text: 'Check out our ',
              children: [
                TextSpan(
                  text: 'manifest',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Theme.of(context).accentColor,
                        decoration: TextDecoration.underline,
                      ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      openURL(
                        'https://github.com/AdeAnima/ByteAdventuresFlutter/wiki/Manifest',
                      );
                    },
                ),
                const TextSpan(text: ' to learn more.')
              ],
            ),
          )
        ],
      );
}

class DetailsWrapper extends StatelessWidget {
  final double width;
  final Widget child;

  const DetailsWrapper({
    required this.width,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: width * 2,
        child: Center(
          child: child,
        ),
      );
}

class ByteAdventuresDetails extends StatelessWidget {
  final Widget headerWidget;
  final String headerText;
  final Widget bodyWidget;

  const ByteAdventuresDetails({
    required this.headerWidget,
    required this.headerText,
    required this.bodyWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          AspectRatio(
            aspectRatio: 1.618,
            child: Container(
              constraints: const BoxConstraints(minHeight: 200),
              decoration: NeonDecoration.neonDecorationImage(context),
              clipBehavior: Clip.hardEdge,
              child: headerWidget,
            ),
          ),
          const SizedBox(height: 16),
          Row(children: [
            Flexible(
              child: Text(
                headerText,
                style: Theme.of(context).textTheme.headline4,
                maxLines: 1,
              ),
            )
          ]),
          const SizedBox(height: 8),
          Row(
            children: [Flexible(child: bodyWidget)],
          )
        ],
      );
}

class VideoWidget extends StatefulWidget {
  final String source;
  final bool loop;
  final double? overWriteAspectRatio;

  const VideoWidget({
    required this.source,
    this.loop = false,
    this.overWriteAspectRatio,
    Key? key,
  }) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.source)
      ..setLooping(widget.loop)
      ..setVolume(0.0)
      ..play()
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) => _controller.value.isInitialized
      ? AspectRatio(
          aspectRatio: 1.618,
          child: ClipRect(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                height: _controller.value.size.height,
                width: _controller.value.size.width,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
        )
      : Container();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
