import 'package:byte_adventures/infrastructure/static_speaker_repository.dart';
import 'package:byte_adventures/presentation/pages/page_content.dart';
import 'package:byte_adventures/presentation/pages/program_page.dart';
import 'package:byte_adventures/presentation/pages/speaker_page.dart';

import 'package:flutter/material.dart';

class Routes {
  static const String landing = '/';
  static const String about = '/about';
  static const String speakers = '/speakers';
  static const String talks = '/talks';
  static const String tickets = '/tickets';
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  final safeRouteName = settings.name ?? '/';
  if (safeRouteName == Routes.talks) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => const ProgramPage(),
    );
  }
  final speakers = StaticSpeakerRepository().speakers.values.toList();
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
          builder: (context) => const ProgramPage(),
        );
      }

    case Routes.talks:
      break;
    default:
  }

  return MaterialPageRoute(
    settings: settings,
    builder: (context) => PageContent(initialRouteSettings: settings, speakers: speakers),
  );
}
