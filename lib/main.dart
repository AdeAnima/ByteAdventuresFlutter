import 'package:byte_adventures/generated/l10n.dart';
import 'package:byte_adventures/presentation/pages/landing_page.dart';
import 'package:byte_adventures/presentation/pages/participants_page.dart';
import 'package:byte_adventures/presentation/pages/tickets_page.dart';
import 'package:byte_adventures/presentation/theme.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _pageViewController,
          scrollDirection: Axis.vertical,
          children: [
            LandingPage(
              windowHeight: windowHeight,
              goDownCallback: () {
                _pageViewController.animateToPage(2,
                    duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
              },
            ),
            const ParticipantsPage(),
            const TicketsPage(),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      if (_pageViewController.hasClients)
                        IconButton(
                            icon: const Icon(Icons.arrow_upward_outlined),
                            onPressed: () {
                              _pageViewController.animateToPage(
                                _pageViewController.page!.toInt() - 1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.decelerate,
                              );
                            })
                      else
                        Container(),
                    ],
                  ),
                ),
                const Padding(
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
