import 'package:byte_adventures/domain/participant.dart';
import 'package:byte_adventures/generated/l10n.dart';
import 'package:byte_adventures/infrastructure/static_speaker_repository.dart';
import 'package:byte_adventures/presentation/pages/page_content.dart';
import 'package:byte_adventures/presentation/routes/router.dart';
import 'package:byte_adventures/presentation/theme.dart';

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
  // Firebase.initializeApp();

  runApp(ByteAdventuresWorld());
}

class ByteAdventuresWorld extends StatelessWidget {
  ByteAdventuresWorld({Key? key}) : super(key: key);

  final List<Participant> speakers = StaticSpeakerRepository().speakers.values.toList();

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
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
