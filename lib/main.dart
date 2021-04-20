import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:byte_adventures/mascot_animation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_strategy/url_strategy.dart';

const textColor = Colors.white70;

void main() {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(MyApp());
}

const double pageInsetHorizontal = 30;
const double pageInsetVertical = 20;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ByteAdventures2021',
        theme: ThemeData(
          backgroundColor: Color(0xFF111111),
          primaryColor: Color(0xFF282C34),
          accentColor: Color(0xFFFB1B50),
          brightness: Brightness.dark,
          buttonColor: Color(0xFFAF1CFE),
          shadowColor: Color(0xFFF54B26),
          textTheme: TextTheme(
            headline1: GoogleFonts.firaCode(textStyle: TextStyle(fontSize: 48, letterSpacing: 3.0)),
            headline2: GoogleFonts.firaCode(
                textStyle: TextStyle(fontSize: 36, fontWeight: FontWeight.w700, letterSpacing: 3.0)),
            headline3: GoogleFonts.firaCode(textStyle: TextStyle(fontSize: 30, letterSpacing: 3.0)),
            headline4: GoogleFonts.firaCode(textStyle: TextStyle(fontSize: 24, letterSpacing: 3.0)),
            headline5: GoogleFonts.firaCode(
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 3.0)),
            headline6: GoogleFonts.firaCode(textStyle: TextStyle(fontSize: 18, letterSpacing: 3.0)),
            bodyText1: GoogleFonts.firaCode(textStyle: TextStyle(fontSize: 16)),
            bodyText2: GoogleFonts.firaCode(textStyle: TextStyle(fontSize: 14)),
            caption: GoogleFonts.firaCode(textStyle: TextStyle(fontSize: 12)),
          ),
        ),
        home: PageContent(),
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
    final windowWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(children: [
      PageView(
        controller: _pageViewController,
        children: [
          LandingPage(
            windowHeight: windowHeight,
            goDownCallback: () {
              _pageViewController.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.easeInOut);
            },
          ),
          // Container(
          //     padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          //     child: Center(
          //       child: Column(
          //         children: [
          //           AutoSizeText(
          //             'Meet the organizers',
          //             style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.white),
          //           ),
          //           SizedBox(height: 24),
          //           SizedBox(
          //             height: windowHeight * 0.4,
          //             width: windowWidth > 800 ? windowWidth * 0.7 : windowWidth * 0.9,
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 Material(
          //                   child: Image.asset('assets/images/marten.jpeg'),
          //                 ),
          //                 SizedBox(
          //                   width: 400,
          //                   child: Column(
          //                     children: [
          //                       AutoSizeText(
          //                         'Marten Westphal',
          //                         style: Theme.of(context).textTheme.headline3!,
          //                         textAlign: TextAlign.left,
          //                       ),
          //                       SizedBox(height: 8),
          //                       AutoSizeText(
          //                         'Co-Founder & CTO of the yamuntu GmbH',
          //                         style: Theme.of(context).textTheme.headline4!,
          //                         textAlign: TextAlign.left,
          //                       ),
          //                       SizedBox(height: 8),
          //                       AutoSizeText(
          //                         'Martin Westphal is a Nerd by heart, loves challenges of any kind and is a firm believer that most people are capable of way more than they believe, if you give them the chance and encourage them. As the co-founder & CTO of the yamuntu GmbH, leader & co-founder of the byteAdventures Community, founder of the Hamburg Dart, Firebase and byteAdventures Meetups, he is trying to help people achieve more and believe in themselves, to create great things with technology.',
          //                         softWrap: true,
          //                         style: Theme.of(context).textTheme.headline6!,
          //                         textAlign: TextAlign.left,
          //                       ),
          //                     ],
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //           SizedBox(height: 24),
          //           SizedBox(
          //             height: windowHeight * 0.4,
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               children: [
          //                 OrgaProfileImage(
          //                   windowHeight: windowHeight,
          //                   imagePath: 'assets/images/marten.jpeg',
          //                 ),
          //                 OrgaProfileInfos(windowHeight: windowHeight)
          //               ],
          //             ),
          //           ),
          //         ],
          //       ),
          //     ))
        ],
        scrollDirection: Axis.vertical,
      ),
      IgnorePointer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black54],
              begin: Alignment(0.0, 0.8),
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          color: Colors.black45,
          child: Text(
            'w:$windowWidth; h: $windowHeight',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
      Align(
        child: GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: AutoSizeText(
                  'What\'s my name?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6!,
                ),
              ),
            );
          },
          child: SizedBox(
            child: MascotAnimation(),
            height: windowWidth > 1000 ? 300 : 150,
            width: windowWidth > 1000 ? 300 : 150,
          ),
        ),
        alignment: Alignment(windowWidth > 1000 ? -0.75 : -0.9, windowWidth > 1000 ? 0.1 : 0.25),
      ),
      Align(
        alignment: Alignment(windowWidth > 600 ? 0.95 : 0.3, 0.95),
        child: SocialMediaIconRow(),
      ),
    ]));
  }
}

class OrgaProfileInfos extends StatelessWidget {
  const OrgaProfileInfos({
    Key? key,
    required this.windowHeight,
  }) : super(key: key);

  final double windowHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: windowHeight * 0.4,
      child: Column(
        children: [
          AutoSizeText(
            'Marten Westphal',
            style: Theme.of(context).textTheme.headline3!,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 8),
          AutoSizeText(
            'Co-Founder & CTO of the yamuntu GmbH',
            style: Theme.of(context).textTheme.headline4!,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 8),
          AutoSizeText(
            'Martin Westphal is a Nerd by heart, loves challenges of any kind and is a firm believer that most people are capable of way more than they believe, if you give them the chance and encourage them. As the co-founder & CTO of the yamuntu GmbH, leader & co-founder of the byteAdventures Community, founder of the Hamburg Dart, Firebase and byteAdventures Meetups, he is trying to help people achieve more and believe in themselves, to create great things with technology.',
            softWrap: true,
            style: Theme.of(context).textTheme.headline6!,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}

class OrgaProfileImage extends StatelessWidget {
  final String imagePath;

  const OrgaProfileImage({
    Key? key,
    required this.windowHeight,
    required this.imagePath,
  }) : super(key: key);

  final double windowHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: windowHeight * 0.4,
      child: Material(
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}

class SocialMediaIconRow extends StatelessWidget {
  const SocialMediaIconRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: FaIcon(FontAwesomeIcons.twitterSquare),
              onPressed: () {
                _openURL('https://twitter.com/byte_adventures');
              }),
          IconButton(
              icon: FaIcon(FontAwesomeIcons.instagramSquare),
              onPressed: () {
                _openURL('https://www.instagram.com/byte_adventures/');
              }),
          IconButton(
              icon: FaIcon(FontAwesomeIcons.linkedin),
              onPressed: () {
                _openURL('https://www.linkedin.com/events/byteadventures-conference20216778733206616215553/');
              }),
          IconButton(
              icon: FaIcon(FontAwesomeIcons.spotify),
              onPressed: () {
                _openURL('https://open.spotify.com/user/prip5qu3ak?si=1f865b0510324c21');
              }),
          IconButton(
              icon: FaIcon(FontAwesomeIcons.envelopeSquare),
              onPressed: () {
                _openURL('mailto:info@byte-ad.ventures');
              }),
        ],
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  final VoidCallback goDownCallback;
  final double windowHeight;

  LandingPage({Key? key, required this.windowHeight, required this.goDownCallback}) : super(key: key);

  final subheaderTextsGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    final double windowWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset('assets/images/background.png').image,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: windowHeight * 0.16,
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: AutoSizeText(
              'May 24th & 25th 2021',
              style: Theme.of(context).textTheme.headline3!,
              maxLines: 1,
            ),
          ),
          SizedBox(height: 12),
          AutoSizeText(
            'ByteAdventures',
            style: Theme.of(context).textTheme.headline1!,
            maxLines: 1,
          ),
          SizedBox(height: 8),
          AutoSizeText(
            'Share your excitement.',
            style: Theme.of(context).textTheme.headline3!,
            textAlign: TextAlign.center,
            maxLines: 1,
            group: subheaderTextsGroup,
          ),
          AutoSizeText(
            'Shape the community.',
            style: Theme.of(context).textTheme.headline3!,
            textAlign: TextAlign.center,
            maxLines: 1,
            group: subheaderTextsGroup,
          ),
          AutoSizeText(
            'Join ByteAdventures.',
            style: Theme.of(context).textTheme.headline3!,
            textAlign: TextAlign.center,
            maxLines: 1,
            group: subheaderTextsGroup,
          ),
          SizedBox(height: windowHeight * 0.24),
          AutoSizeText(
            'In Dev. For more infos, click below',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: Theme.of(context).textTheme.headline6!,
          ),
          IconButton(
            tooltip: 'Check current website',
            icon: Icon(
              // Icons.expand_more_outlined,
              Icons.web_outlined,
              size: 36,
            ),
            onPressed: () {
              _openURL('https://byteadventuresconference2021.w.tame.events');
            },
          ),
          SizedBox(height: windowHeight * 0.16),
        ],
      ),
    );
  }
}

_openURL(String urlString) async {
  if (await canLaunch(urlString)) {
    launch(urlString);
  }
}

class HomeRouteInformationParser extends RouteInformationParser<NavigationRoute> {
  @override
  Future<NavigationRoute> parseRouteInformation(RouteInformation routeInformation) async {
    if (routeInformation.location == null) {
      throw Exception('Unknown route info');
    }

    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.length == 0) {
      return HomeRoute();
    }

    if (uri.pathSegments.length == 1) {
      final pathName = uri.pathSegments.elementAt(0).toString();
      switch (pathName) {
        case 'overview':
          break;
        case 'infos':
          break;
        case 'speakers':
          break;
        case 'partners':
          break;
        case 'team':
          break;
        default:
          return HomeRoute();
      }
    }

    return HomeRoute();
  }

  @override
  RouteInformation restoreRouteInformation(NavigationRoute navigationRoute) {
    return RouteInformation(location: navigationRoute.route);
  }
}

abstract class NavigationRoute {
  int get pageIndex;
  String get route;
}

class HomeRoute extends NavigationRoute {
  @override
  int get pageIndex => 0;

  @override
  String get route => '/';
}
