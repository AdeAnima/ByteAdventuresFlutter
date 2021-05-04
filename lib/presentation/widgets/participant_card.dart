import 'package:byte_adventures/domain/participant.dart';
import 'package:byte_adventures/presentation/helpers/size_sensitive_textstyle.dart';
import 'package:byte_adventures/presentation/widgets/neon_decoration.dart';
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
        aspectRatio: 1 / 1,
        child: Card(
          child: Container(
            decoration: NeonDecoration.neonDecorationImage(
              context,
              decorationImage: DecorationImage(
                image: NetworkImage(widget.participant.pictureUrl.toString()),
                fit: BoxFit.cover,
              ),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.participant.firstName,
                  style: Theme.of(context).textTheme.headline6!.resize(context),
                )
              ],
            ),
          ),
        ),
      );
}
