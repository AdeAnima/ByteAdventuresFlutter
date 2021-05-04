import 'package:byte_adventures/domain/activities.dart';
import 'package:byte_adventures/domain/i_speaker_repository.dart';
import 'package:byte_adventures/domain/participant.dart';
import 'package:byte_adventures/domain/platform_profile.dart';

class StaticSpeakerRepository implements ISpeakerRepository {
  @override
  List<Participant> get speakers => List.generate(
        12,
        (index) => Participant(
          firstName: 'Martin',
          lastName: 'Westphal',
          shortBio: 'Something something somthing',
          pictureUrl: Uri.parse('https://cdn.filestackcontent.com/VlsPVuGRfWqFQMxsBsKg'),
          firstSpeakerExperience: '',
          favoriteGame: 'Fallout 4',
          favoriteTechnology: 'Flutter',
          preferredCodeLang: 'Dart',
          catsOrDogs: 'Dogs',
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://twitter.com/AdeAnima'),
              platform: Platform.twitter,
            ),
          ],
          thingsDoing: [
            PersonalInterest(
              activity: 'Coding',
              pictureUrl: Uri.parse('https://cdn.filestackcontent.com/VlsPVuGRfWqFQMxsBsKg'),
              homepage: Uri.parse('https://twitter.com/AdeAnima'),
              description: 'Testing the things to do',
            )
          ],
        ),
      );
}
