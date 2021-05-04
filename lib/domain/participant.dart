import 'package:byte_adventures/domain/activities.dart';
import 'package:byte_adventures/domain/platform_profile.dart';
import 'package:byte_adventures/domain/talk.dart';

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
  final List<Activity> thingsDoing;
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
