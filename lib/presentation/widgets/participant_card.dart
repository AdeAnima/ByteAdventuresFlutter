import 'package:auto_size_text/auto_size_text.dart';
import 'package:byte_adventures/domain/participant.dart';
import 'package:byte_adventures/presentation/widgets/neon_glow_shadow.dart';
import 'package:flutter/material.dart';

class ParticipantCard extends StatefulWidget {
  final Participant participant;

  final Color? shadowColor1;
  final Color? shadowColor2;

  const ParticipantCard({
    required this.participant,
    Key? key,
    this.shadowColor1,
    this.shadowColor2,
  }) : super(key: key);

  @override
  _ParticipantCardState createState() => _ParticipantCardState();
}

class _ParticipantCardState extends State<ParticipantCard> {
  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 0.618,
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: DecorationImage(
                image: NetworkImage(widget.participant.pictureUrl.toString()),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: NeonGlowShadow.themeGlow(context),
              border: Border.all(color: Theme.of(context).accentColor, width: 2),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [AutoSizeText(widget.participant.firstName)],
            ),
          ),
        ),
      );
}
