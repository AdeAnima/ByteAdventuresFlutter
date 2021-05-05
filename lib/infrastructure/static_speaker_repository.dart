import 'package:byte_adventures/domain/activities.dart';
import 'package:byte_adventures/domain/i_speaker_repository.dart';
import 'package:byte_adventures/domain/participant.dart';
import 'package:byte_adventures/domain/platform_profile.dart';

class StaticSpeakerRepository implements ISpeakerRepository {
  @override
  List<Participant> get speakers => [
        Participant(
          firstName: 'Martin',
          lastName: 'Westphal',
          shortBio:
              'Martin Westphal is a Nerd by heart, loves challenges of any kind and is a firm believer that most people are capable of way more than they believe, if you give them the chance and encourage them. As the co-founder & CTO of the yamuntu GmbH, leader & co-founder of the byteAdventures Community, founder of the Hamburg Dart, Firebase and byteAdventures Meetups, he is trying to help people achieve more and believe in themselves, to create great things with technology.',
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
      ];
}
