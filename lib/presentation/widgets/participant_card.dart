import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

enum Platform { github, gitlab, facebook, instagram, linkedIn, xing, twitter, spotify, blog }

class PlatformProfile {
  final Uri profileUrl;
  final Platform platform;

  PlatformProfile({required this.profileUrl, required this.platform});
}

class ThingDoing {
  final String name;
  final Uri pictureOrLogo;
  final Uri linkToThing;
  final String shortDescription;

  ThingDoing({
    required this.name,
    required this.pictureOrLogo,
    required this.linkToThing,
    required this.shortDescription,
  });
}

class CodeLang {
  final String name;

  CodeLang({required this.name});
}

class Talk {
  final String title;
  final CodeLang? codeLang;
  final List<String> keywords;
  final String shortAbstract;
  final Uri pitchVideoUrl;
  final DateTime startsAt;
  final DateTime endsAt;
  final List<Participant> participants;

  Talk({
    required this.title,
    required this.keywords,
    required this.shortAbstract,
    required this.pitchVideoUrl,
    required this.startsAt,
    required this.endsAt,
    required this.participants,
    this.codeLang,
  });
}

class Participant {
  final String firstName;
  final String lastName;
  final String shortBio;
  final Uri pictureUrl;
  final String firstSpeakerExperience;
  final String favoriteGame;
  final String favoriteTechnology;
  final String preferredCodeLang;
  final String catsOrDogs;
  final List<PlatformProfile> profiles;
  final Map<String, String>? additionalInfos;
  final List<ThingDoing> thingsDoing;
  final List<Talk>? talks;

  Participant({
    required this.firstName,
    required this.lastName,
    required this.shortBio,
    required this.pictureUrl,
    required this.firstSpeakerExperience,
    required this.favoriteGame,
    required this.favoriteTechnology,
    required this.preferredCodeLang,
    required this.catsOrDogs,
    required this.profiles,
    required this.thingsDoing,
    this.additionalInfos,
    this.talks,
  });
}

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
  Widget build(BuildContext context) {
    final color1 = widget.shadowColor1 ?? Theme.of(context).accentColor;
    final color2 = widget.shadowColor2 ?? Theme.of(context).buttonColor;
    return AspectRatio(
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
            boxShadow: [
              BoxShadow(
                color: color1.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 16,
                offset: const Offset(-8, 0),
              ),
              BoxShadow(
                color: color2.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 16,
                offset: const Offset(8, 0),
              ),
              BoxShadow(
                color: color1.withOpacity(0.2),
                spreadRadius: 16,
                blurRadius: 32,
                offset: const Offset(-8, 0),
              ),
              BoxShadow(
                color: color2.withOpacity(0.2),
                spreadRadius: 16,
                blurRadius: 32,
                offset: const Offset(8, 0),
              )
            ],
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
}
