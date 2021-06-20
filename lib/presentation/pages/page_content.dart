import 'package:byte_adventures/domain/participant.dart';
import 'package:byte_adventures/presentation/pages/about_the_conference.dart';
import 'package:byte_adventures/presentation/pages/landing_page.dart';
import 'package:byte_adventures/presentation/pages/participants_page.dart';
import 'package:byte_adventures/presentation/pages/speaker_page.dart';
import 'package:byte_adventures/presentation/pages/tickets_page.dart';
import 'package:byte_adventures/presentation/routes/router.dart';
import 'package:byte_adventures/presentation/widgets/social_media_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
                    pageBuilder: (context, animation1, animation2) => SpeakerPage(speaker: speaker),
                  ),
                );
              } on StateError catch (_) {
                // ignore: avoid_print
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
            LandingPage(
              goDownCallback: () {
                _pageViewController.animateToPage(
                  MediaQuery.of(context).size.width > 840 ? 4 : 5,
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
