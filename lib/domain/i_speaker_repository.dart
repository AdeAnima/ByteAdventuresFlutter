import 'package:byte_adventures/domain/participant.dart';

abstract class ISpeakerRepository {
  Map<int, Participant> get speakers;
}
