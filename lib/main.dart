import 'dart:io' hide Platform;
import 'dart:math';

import 'package:byte_adventures/domain/participant.dart';
import 'package:byte_adventures/domain/platform_profile.dart';
import 'package:byte_adventures/domain/talk.dart';
import 'package:byte_adventures/generated/l10n.dart';
import 'package:byte_adventures/infrastructure/helpers.dart';
import 'package:byte_adventures/infrastructure/static_speaker_repository.dart';
import 'package:byte_adventures/presentation/pages/about_the_conference.dart';
import 'package:byte_adventures/presentation/pages/landing_page.dart';
import 'package:byte_adventures/presentation/pages/participants_page.dart';
import 'package:byte_adventures/presentation/pages/tickets_page.dart';
import 'package:byte_adventures/presentation/theme.dart';
import 'package:byte_adventures/presentation/widgets/neon_decoration.dart';

import 'package:byte_adventures/presentation/widgets/social_media_row.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_strategy/url_strategy.dart';

class Routes {
  static const String landing = '/';
  static const String about = '/about';
  static const String speakers = '/speakers';
  static const String talks = '/talks';
  static const String tickets = '/tickets';
}

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp();

  runApp(ByteAdventuresWorld());
}

class TalkRepository {
  static Map<int, Talk> get talks => {
        1: Talk(
          title: 'How I found the holy grail of Tech Stacks 😎 mostly... 😬 samewhat... 🥲 just let me explain.... 😅',
          keywords: ['Flutter', 'Cross Platform Development', 'Dart Lang'],
          shortAbstract:
              'I hate doing things twice. Or doing unnecessary work at all for that matter. After all thats the best thing about being a software developer, that you can automate stuff and don\'t have to worry about it anymore. (In theory at least)\nBut then again you have the problem as a fullstack developer that you can\'t simply use your frontend code and in your backend. And yes, of course I hear the people screaming JAVASCRIPT, but common... really?\nSo let me take on this crazy quest I have been on ever since I started coding more than 10 years ago of finding my Holy Grail of coding and how I finally did. 😎\nKind of... 😬\nSomewhat... 🥲\nJust let me explain 😅',
          participants: [1],
        ),
      };
}

class ByteAdventuresWorld extends StatelessWidget {
  ByteAdventuresWorld({Key? key}) : super(key: key);

  final List<Participant> speakers = StaticSpeakerRepository().speakers.values.toList();

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          final safeRouteName = settings.name ?? '/';
          final uri = Uri.parse(safeRouteName);
          if (uri.pathSegments.length != 2) {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => PageContent(initialRouteSettings: settings, speakers: speakers),
            );
          }
          switch ('/${uri.pathSegments[0]}') {
            case Routes.speakers:
              try {
                final speaker = speakers.firstWhere(
                  (speaker) => speaker.speakerUriEncodedName == uri.pathSegments[1],
                );
                return PageRouteBuilder(
                  settings: settings,
                  fullscreenDialog: true,
                  opaque: true,
                  pageBuilder: (context, a, b) => SpeakerPage(speaker: speaker),
                );
              } catch (e) {
                return MaterialPageRoute(
                  settings: settings,
                  builder: (context) => PageContent(initialRouteSettings: settings, speakers: speakers),
                );
              }

            case Routes.talks:
              break;
            default:
          }
        },
        title: 'ByteAdventures 2021',
        theme: byteAdventuresTheme,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: PageContent(speakers: speakers),
      );
}

class PlattformIcon extends StatelessWidget {
  final Platform platform;
  const PlattformIcon({
    required this.platform,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (platform) {
      case Platform.xing:
        return const FaIcon(FontAwesomeIcons.xingSquare);
      case Platform.facebook:
        return const FaIcon(FontAwesomeIcons.facebookSquare);
      case Platform.github:
        return const FaIcon(FontAwesomeIcons.githubSquare);
      case Platform.gitlab:
        return const FaIcon(FontAwesomeIcons.gitlab);
      case Platform.linkedIn:
        return const FaIcon(FontAwesomeIcons.linkedin);
      case Platform.instagram:
        return const FaIcon(FontAwesomeIcons.instagram);
      case Platform.spotify:
        return const FaIcon(FontAwesomeIcons.spotify);
      case Platform.twitter:
        return const FaIcon(FontAwesomeIcons.twitter);
      case Platform.blog:
      default:
        return const FaIcon(FontAwesomeIcons.globe);
    }
  }
}

class PlattformProfileButton extends StatelessWidget {
  final PlatformProfile platformProfile;

  const PlattformProfileButton({
    required this.platformProfile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () => openURL(platformProfile.profileUrl.toString()),
        icon: PlattformIcon(platform: platformProfile.platform),
      );
}

class SpeakerPage extends StatelessWidget {
  final Participant speaker;

  const SpeakerPage({
    required this.speaker,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SizedBox(
            height: 32,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    width: min(420, MediaQuery.of(context).size.width - 64 * 2),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Container(
                          decoration: NeonDecoration.neonDecorationImage(
                            context,
                            decorationImage: DecorationImage(
                              image: Image.network(
                                speaker.pictureUrl.toString(),
                              ).image,
                              fit: BoxFit.cover,
                              alignment: speaker.pictureAligment,
                            ),
                          ),
                          child: AspectRatio(
                            aspectRatio: 0.618,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                gradient: const LinearGradient(
                                  colors: [Colors.transparent, Colors.black87],
                                  begin: Alignment.center,
                                  end: Alignment.centerLeft,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                speaker.firstName,
                                                style: Theme.of(context).textTheme.headline1,
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    if (speaker.profiles.isEmpty)
                                      Container()
                                    else
                                      SizedBox(
                                        height: 32,
                                        child: ListView.separated(
                                          separatorBuilder: (context, index) => const SizedBox(width: 8),
                                          clipBehavior: Clip.antiAlias,
                                          cacheExtent: 20.0,
                                          scrollDirection: Axis.horizontal,
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          itemCount: speaker.profiles.length,
                                          itemBuilder: (context, index) =>
                                              PlattformProfileButton(platformProfile: speaker.profiles[index]),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          speaker.job.title,
                          style: Theme.of(context).textTheme.headline4,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                            text: speaker.job.name,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openURL(speaker.job.link.toString());
                              },
                            style: Theme.of(context).textTheme.headline3!.copyWith(
                                  color: Theme.of(context).accentColor,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          speaker.shortBio,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ],
          ),
        ),
      );
}

class PageContent extends StatefulWidget {
  final List<Participant> speakers;
  final RouteSettings? initialRouteSettings;

  const PageContent({
    required this.speakers,
    this.initialRouteSettings,
    Key? key,
  }) : super(key: key);

  @override
  _PageContentState createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {
  final _pageViewController = PageController();

  Future<void> _goToSection(int sectionIndex) async {
    setState(
      () {
        _pageViewController.animateToPage(
          sectionIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.decelerate,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((duration) {
      if (widget.initialRouteSettings?.name != null) {
        final uri = Uri.parse(widget.initialRouteSettings!.name!);
        switch ('/${uri.pathSegments[0]}') {
          case Routes.landing:
            _goToSection(0);
            break;
          case Routes.about:
            _goToSection(1);
            break;
          case Routes.speakers:
            final speakerIndex = MediaQuery.of(context).size.width > 840 ? 2 : 3;
            _goToSection(speakerIndex);
            if (uri.pathSegments.length == 2) {
              try {
                final speaker = widget.speakers.firstWhere(
                  (speaker) => speaker.speakerUriEncodedName == uri.pathSegments[1],
                );
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    settings: widget.initialRouteSettings,
                    pageBuilder: (context, _, _2) => SpeakerPage(speaker: speaker),
                  ),
                );
              } on StateError catch (_) {
                print('${uri.pathSegments[1]} could not be found');
              }
            }
            break;
          case Routes.tickets:
            final ticketsIndex = MediaQuery.of(context).size.width > 840 ? 3 : 4;
            _goToSection(ticketsIndex);

            break;
          default:
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _pageViewController,
          onPageChanged: _goToSection,
          pageSnapping: width < 800,
          scrollDirection: Axis.vertical,
          children: [
            // AboutTheConference(),
            LandingPage(
              goDownCallback: () {
                _pageViewController.animateToPage(
                  MediaQuery.of(context).size.width > 840 ? 3 : 4,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut,
                );
              },
            ),
            if (width > 840)
              AboutTheConferenceDesktop()
            else ...[AboutTheConferenceMobile1(), AboutTheConferenceMobile2()],
            ParticipantsPage(speakers: widget.speakers),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // IconButton(
                  //   icon: const Icon(Icons.arrow_upward_outlined),
                  //   enableFeedback: false,
                  //   onPressed: _currentPage > 0
                  //       ? () {
                  //
                  //         }
                  //       : null,
                  // ),
                  // IconButton(
                  //   icon: const Icon(Icons.arrow_downward_outlined),
                  //   onPressed: _currentPage <
                  //       ? () {
                  //           _pageViewController.animateToPage(
                  //             _pageViewController.page!.toInt() + 1,
                  //             duration: const Duration(milliseconds: 300),
                  //             curve: Curves.decelerate,
                  //           );
                  //         }
                  //       : null,
                  // ),
                  IconButton(
                    onPressed: () {
                      showAboutDialog(
                        context: context,
                        applicationIcon: Image.asset(
                          'assets/images/logo.png',
                          height: 100,
                          width: 100,
                        ),
                        applicationName: 'ByteAdventures Website',
                        applicationVersion: '2021.05.24.1646',
                        children: [
                          Text(
                            'Screensize h:$height w:$width',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      );
                    },
                    icon: const Icon(Icons.info_outline),
                  ),
                  const Spacer(),
                  const SocialMediaIconRow(),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
