import 'package:byte_adventures/domain/participant.dart';

abstract class ISpeakerRepository {
  List<Participant> get speakers;
}
