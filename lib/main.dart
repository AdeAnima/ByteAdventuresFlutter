import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:byte_adventures/generated/l10n.dart';
import 'package:byte_adventures/infrastructure/helpers.dart';
import 'package:byte_adventures/presentation/pages/participants_page.dart';
import 'package:byte_adventures/presentation/theme.dart';
import 'package:byte_adventures/presentation/widgets/embeded_i_frame.dart';
import 'package:byte_adventures/presentation/widgets/mascot_animation.dart';
import 'package:byte_adventures/presentation/widgets/neon_decoration.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(const ByteAdventuresWorld());
}

class ByteAdventuresWorld extends StatelessWidget {
  const ByteAdventuresWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ByteAdventures 2021',
        theme: byteAdventuresTheme,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const PageContent(),
      );
}

class PageContent extends StatefulWidget {
  const PageContent({
    Key? key,
  }) : super(key: key);

  @override
  _PageContentState createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {
  final _pageViewController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final windowHeight = MediaQuery.of(context).size.height;
    final windowWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (newPageIndex) {
              setState(() {
                _currentPage = newPageIndex;
              });
            },
            controller: _pageViewController,
            scrollDirection: Axis.vertical,
            children: [
              LandingPage(
                windowHeight: windowHeight,
                goDownCallback: () {
                  _pageViewController.animateToPage(1,
                      duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
                },
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  constraints: const BoxConstraints(maxWidth: 900, maxHeight: 700),
                  decoration: NeonDecoration.neonDecorationColor(context, decorationColor: Colors.white),
                  child: const Iframe(iframeUrl: 'https://tickets.byte-adventures.com/'),
                ),
              ),
              const ParticipantsPage(),
            ],
          ),
          IgnorePointer(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black54],
                  begin: Alignment(0.0, 0.8),
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(seconds: 1),
            alignment: _animatedMascotAlign(windowWidth),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: AutoSizeText(
                      S.of(context).iNeedAName,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline6!,
                    ),
                  ),
                );
              },
              child: SizedBox(
                height: windowWidth > 1000 ? 300 : 150,
                width: windowWidth > 1000 ? 300 : 150,
                child: const MascotAnimation(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Alignment _animatedMascotAlign(double windowWidth) => _currentPage == 0
      ? Alignment(windowWidth > 1000 ? -0.75 : -0.9, windowWidth > 1000 ? 0.1 : 0.25)
      : Alignment(windowWidth > 1000 ? -0.9 : -0.9, windowWidth > 1000 ? 0.8 : 0.8);
}

class OrgaProfileImage extends StatelessWidget {
  final String imagePath;

  const OrgaProfileImage({
    required this.windowHeight,
    required this.imagePath,
    Key? key,
  }) : super(key: key);

  final double windowHeight;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: windowHeight * 0.4,
        child: Material(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(imagePath),
          ),
        ),
      );
}

class SocialMediaIconRow extends StatelessWidget {
  const SocialMediaIconRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.twitterSquare),
                onPressed: () {
                  openURL('https://twitter.com/byte_adventures');
                }),
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.instagramSquare),
                onPressed: () {
                  openURL('https://www.instagram.com/byte_adventures/');
                }),
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin),
                onPressed: () {
                  openURL('https://www.linkedin.com/events/byteadventures-conference20216778733206616215553/');
                }),
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.spotify),
                onPressed: () {
                  openURL('https://open.spotify.com/user/prip5qu3ak?si=1f865b0510324c21');
                }),
            IconButton(
                icon: const FaIcon(FontAwesomeIcons.envelopeSquare),
                onPressed: () {
                  openURL('mailto:info@byte-ad.ventures');
                }),
          ],
        ),
      );
}

class LandingPage extends StatelessWidget {
  final VoidCallback goDownCallback;
  final double windowHeight;

  LandingPage({
    required this.windowHeight,
    required this.goDownCallback,
    Key? key,
  }) : super(key: key);

  final subheaderTextsGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset('assets/images/background.png').image,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: windowHeight * 0.16,
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: AutoSizeText(
                  'May 24th & 25th 2021',
                  style: Theme.of(context).textTheme.headline3!,
                  maxLines: 1,
                ),
              ),
              const SizedBox(height: 12),
              AutoSizeText(
                'ByteAdventures',
                style: Theme.of(context).textTheme.headline1!,
                maxLines: 1,
              ),
              const SizedBox(height: 8),
              AutoSizeText(
                'Share your excitement.',
                style:
                    windowHeight > 800 ? Theme.of(context).textTheme.headline4! : Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
                group: subheaderTextsGroup,
              ),
              AutoSizeText(
                'Shape the community.',
                style:
                    windowHeight > 800 ? Theme.of(context).textTheme.headline4! : Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
                group: subheaderTextsGroup,
              ),
              AutoSizeText(
                'Join ByteAdventures.',
                style:
                    windowHeight > 800 ? Theme.of(context).textTheme.headline4! : Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
                group: subheaderTextsGroup,
              ),
              if (windowHeight > 800) SizedBox(height: windowHeight * 0.40) else SizedBox(height: windowHeight * 0.30),
              AutoSizeText(
                'In Dev. For more infos, click below',
                textAlign: TextAlign.center,
                maxLines: 2,
                style:
                    windowHeight > 800 ? Theme.of(context).textTheme.headline4 : Theme.of(context).textTheme.bodyText1,
              ),
              IconButton(
                tooltip: 'Check current website',
                icon: const Icon(
                  // Icons.expand_more_outlined,
                  Icons.web_outlined,
                  size: 36,
                ),
                onPressed: () {
                  openURL('https://byteadventuresconference2021.w.tame.events');
                },
              ),
              const SocialMediaIconRow(),
            ],
          ),
        ),
      );
}
