import 'package:byte_adventures/infrastructure/static_speaker_repository.dart';
import 'package:byte_adventures/presentation/widgets/byte_overlayed_page.dart';
import 'package:byte_adventures/presentation/widgets/participant_card.dart';
import 'package:flutter/material.dart';

class ParticipantsPage extends StatelessWidget {
  const ParticipantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final windowHeight = MediaQuery.of(context).size.height;
    final participants = [StaticSpeakerRepository().speakers.first];

    return ByteOverlayedPage(
      pageName: 'Speakers',
      socialIconsOverlay: Overlaydefinition(),
      pageContent: Container(
          constraints: BoxConstraints(
            maxHeight: windowHeight / 1.5,
            minWidth: double.infinity,
          ),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1.618,
            padding: const EdgeInsets.all(40),
            scrollDirection: Axis.horizontal,
            children: participants.map((p) => ParticipantCard(participant: p)).toList(),
          )),
    );
  }
}
