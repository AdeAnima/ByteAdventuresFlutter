import 'package:byte_adventures/domain/participant.dart';
import 'package:byte_adventures/domain/platform_profile.dart';
import 'package:byte_adventures/infrastructure/helpers.dart';
import 'package:byte_adventures/main.dart';
import 'package:byte_adventures/presentation/widgets/neon_decoration.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ParticipantCard extends StatefulWidget {
  final Participant participant;

  const ParticipantCard({required this.participant, Key? key}) : super(key: key);

  @override
  _ParticipantCardState createState() => _ParticipantCardState();
}

class _ParticipantCardState extends State<ParticipantCard> {
  bool showDetails = false;

  Alignment get _getGradientAligment => showDetails ? Alignment.centerRight : Alignment.center;

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 1 / 1,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('${Routes.speakers}/${widget.participant.speakerUriEncodedName}');
          },
          child: Card(
            child: Container(
              decoration: NeonDecoration.neonDecorationImage(
                context,
                decorationImage: DecorationImage(
                  image: Image.network(
                    widget.participant.pictureUrl.toString(),
                    loadingBuilder: (context, child, loadingProgress) => BlurHash(hash: widget.participant.pictureHash),
                  ).image,
                  fit: BoxFit.cover,
                  alignment: widget.participant.pictureAligment,
                ),
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: LinearGradient(
                    colors: const [Colors.transparent, Colors.black87],
                    begin: _getGradientAligment,
                    end: Alignment.centerLeft,
                  ),
                ),
                child: !showDetails
                    ? Row(
                        children: [
                          RotatedBox(
                            quarterTurns: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${widget.participant.firstName} ${widget.participant.lastName}',
                                  style: Theme.of(context).textTheme.headline5!,
                                  textScaleFactor: 0.9,
                                ),
                                const SizedBox(height: 4.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        widget.participant.job.title,
                                        style: Theme.of(context).textTheme.headline6!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        textScaleFactor: 0.7,
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.participant.firstName} ${widget.participant.lastName}',
                            style: Theme.of(context).textTheme.headline4!,
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            widget.participant.job.title,
                            style: Theme.of(context).textTheme.headline6!,
                            textAlign: TextAlign.left,
                            maxLines: 3,
                          ),
                          TextButton(
                            onPressed: () {
                              openURL(widget.participant.job.link.toString());
                            },
                            child: Text(
                              widget.participant.job.name,
                              style: Theme.of(context).textTheme.headline5!.copyWith(
                                    decoration: TextDecoration.underline,
                                  ),
                              maxLines: 3,
                              textScaleFactor: 0.7,
                            ),
                          ),
                          const Spacer(),
                          ...widget.participant.profiles.map((profile) {
                            FaIcon icon;
                            switch (profile.platform) {
                              case Platform.xing:
                                icon = const FaIcon(FontAwesomeIcons.xingSquare);
                                break;
                              case Platform.facebook:
                                icon = const FaIcon(FontAwesomeIcons.facebookSquare);
                                break;
                              case Platform.github:
                                icon = const FaIcon(FontAwesomeIcons.githubSquare);
                                break;
                              case Platform.gitlab:
                                icon = const FaIcon(FontAwesomeIcons.gitlab);
                                break;
                              case Platform.linkedIn:
                                icon = const FaIcon(FontAwesomeIcons.linkedin);
                                break;
                              case Platform.instagram:
                                icon = const FaIcon(FontAwesomeIcons.instagram);
                                break;
                              case Platform.spotify:
                                icon = const FaIcon(FontAwesomeIcons.spotify);
                                break;
                              case Platform.twitter:
                                icon = const FaIcon(FontAwesomeIcons.twitter);
                                break;
                              case Platform.blog:
                              default:
                                icon = const FaIcon(FontAwesomeIcons.globe);
                                break;
                            }
                            return Row(
                              children: [
                                IconButton(icon: icon, onPressed: () => openURL(profile.profileUrl.toString()))
                              ],
                            );
                          }).toList(),
                        ],
                      ),
              ),
            ),
          ),
        ),
      );
}
