import 'package:byte_adventures/domain/participant.dart';
import 'package:byte_adventures/presentation/widgets/byte_overlayed_page.dart';
import 'package:byte_adventures/presentation/widgets/participant_card.dart';
import 'package:flutter/material.dart';

class ParticipantsPage extends StatefulWidget {
  final List<Participant> speakers;

  const ParticipantsPage({
    required this.speakers,
    Key? key,
  }) : super(key: key);

  @override
  _ParticipantsPageState createState() => _ParticipantsPageState();
}

class _ParticipantsPageState extends State<ParticipantsPage> {
  bool mouseOver = false;

  @override
  Widget build(BuildContext context) {
    final windowSize = MediaQuery.of(context).size;

    return ByteOverlayedPage(
      pageName: 'Speakers',
      socialIconsOverlay: Overlaydefinition(),
      pageContent: Container(
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).backgroundColor,
              Colors.transparent,
              Colors.transparent,
              Theme.of(context).backgroundColor
            ],
            stops: const [0.0, 0.05, 0.95, 1.0],
          ),
        ),
        child: SpeakerGallery(
          windowSize: windowSize,
          participants: widget.speakers,
        ),
      ),
    );
  }
}

class SpeakerGallery extends StatelessWidget {
  final List<Participant> participants;

  const SpeakerGallery({
    required this.windowSize,
    required this.participants,
    Key? key,
  }) : super(key: key);

  final Size windowSize;

  @override
  Widget build(BuildContext context) => GridView.count(
        crossAxisSpacing: windowSize.width > 740 ? 48.0 : 16,
        mainAxisSpacing: windowSize.width > 740 ? 48.0 : 32,
        crossAxisCount: windowSize.height > 740 || windowSize.aspectRatio > 1.618 + 0.2 ? 2 : 1,
        childAspectRatio: 1.618,
        cacheExtent: windowSize.width * 2,
        padding: const EdgeInsets.all(60),
        scrollDirection: Axis.horizontal,
        children: participants.map((p) => ParticipantCard(participant: p)).toList(),
      );
}
