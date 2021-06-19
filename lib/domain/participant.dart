import 'dart:math';

import 'package:byte_adventures/domain/activities.dart';
import 'package:byte_adventures/domain/platform_profile.dart';
import 'package:flutter/material.dart';

class Participant {
  final String firstName;
  final String lastName;
  final String shortBio;
  final Uri pictureUrl;
  final Alignment pictureAligment;
  final String pictureHash;
  final int? talkId;
  // final String firstSpeakerExperience;
  // final String favoriteGame;
  // final String favoriteTechnology;
  // final String preferredCodeLang;
  // final String catsOrDogs;
  final List<PlatformProfile> profiles;
  // final Map<String, String>? additionalInfos;
  final JobAtCompany job;
  // final PersonalInterest personalInterest;
  // final List<Talk>? talks;

  Participant({
    required this.firstName,
    required this.lastName,
    required this.pictureUrl,
    required this.job,
    required this.profiles,
    required this.pictureHash,
    this.shortBio = 'coming soon',
    this.talkId,
    this.pictureAligment = const Alignment(-0.3, 0.0),
    // required this.personalInterest,
    // required this.firstSpeakerExperience,
    // required this.favoriteGame,
    // required this.favoriteTechnology,
    // required this.preferredCodeLang,
    // required this.catsOrDogs,
    // required this.thingsDoing,
    // this.additionalInfos,
    // this.talks,
  });

  String get fullName => '$firstName $lastName';

  String get speakerUriEncodedName => Uri.encodeComponent(
          '${firstName.substring(0, min(firstName.length, 4))}-${lastName.substring(0, min(lastName.length, 4))}')
      .toLowerCase();
}
