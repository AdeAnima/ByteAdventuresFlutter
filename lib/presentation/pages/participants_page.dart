import 'package:byte_adventures/infrastructure/static_speaker_repository.dart';
import 'package:byte_adventures/presentation/widgets/byte_overlayed_page.dart';
import 'package:byte_adventures/presentation/widgets/participant_card.dart';
import 'package:flutter/material.dart';

class ParticipantsPage extends StatelessWidget {
  const ParticipantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final windowSize = MediaQuery.of(context).size;
    final participants = StaticSpeakerRepository().speakers;

    return ByteOverlayedPage(
      pageName: 'Speakers',
      socialIconsOverlay: Overlaydefinition(),
      pageContent: Container(
          constraints: BoxConstraints(
            maxHeight: windowSize.height / 1.5,
            minWidth: double.infinity,
          ),
          child: GridView.count(
            crossAxisSpacing: windowSize.width > 700 ? 48.0 : 0,
            mainAxisSpacing: windowSize.width > 700 ? 48.0 : 32,
            crossAxisCount: windowSize.height > 700 || windowSize.aspectRatio > 1.618 + 0.2 ? 2 : 1,
            childAspectRatio: 1.618,
            padding: const EdgeInsets.all(40),
            scrollDirection: Axis.horizontal,
            children: participants.map((p) => ParticipantCard(participant: p)).toList(),
          )),
    );
  }
}
