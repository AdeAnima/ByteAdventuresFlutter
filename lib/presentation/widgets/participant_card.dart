import 'package:byte_adventures/domain/participant.dart';
import 'package:byte_adventures/presentation/helpers/size_sensitive_textstyle.dart';
import 'package:byte_adventures/presentation/widgets/neon_decoration.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.participant.firstName} ${widget.participant.lastName}',
                  style: Theme.of(context).textTheme.headline6!.resize(context),
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.participant.shortBio,
                  style: Theme.of(context).textTheme.bodyText2!.resize(context),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.code,
                      size: 16.0,
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      widget.participant.preferredCodeLang,
                      style: Theme.of(context).textTheme.bodyText1!.resize(context),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
