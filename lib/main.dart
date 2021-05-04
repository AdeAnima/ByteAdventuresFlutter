import 'package:byte_adventures/generated/l10n.dart';
import 'package:byte_adventures/presentation/helpers/size_sensitive_textstyle.dart';
import 'package:byte_adventures/presentation/pages/landing_page.dart';
import 'package:byte_adventures/presentation/pages/participants_page.dart';
import 'package:byte_adventures/presentation/theme.dart';
import 'package:byte_adventures/presentation/widgets/embeded_i_frame.dart';
import 'package:byte_adventures/presentation/widgets/neon_decoration.dart';
import 'package:byte_adventures/presentation/widgets/social_media_row.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      body: Stack(children: [
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Tickets',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline1!.resize(context),
                  ),
                  Container(
                    margin: const EdgeInsets.all(24.0),
                    constraints: const BoxConstraints(maxWidth: 900, maxHeight: 700),
                    decoration: NeonDecoration.neonDecorationColor(context, decorationColor: Colors.white),
                    child: const Iframe(iframeUrl: 'https://tickets.byte-adventures.com/'),
                  ),
                ],
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
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SocialMediaIconRow(),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
