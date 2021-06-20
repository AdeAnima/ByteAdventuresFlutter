import 'package:byte_adventures/domain/i_talks_repository.dart';
import 'package:byte_adventures/domain/talk.dart';

class TalkRepository implements ITalksRepository {
  static Map<int, Talk> get talks => {
        1: Talk(
          title: 'How I found the holy grail of Tech Stacks 😎 mostly... 😬 samewhat... 🥲 just let me explain.... 😅',
          keywords: ['Flutter', 'Cross Platform Development', 'Dart Lang'],
          shortAbstract:
              'I hate doing things twice. Or doing unnecessary work at all for that matter. After all thats the best thing about being a software developer, that you can automate stuff and don\'t have to worry about it anymore. (In theory at least)\nBut then again you have the problem as a fullstack developer that you can\'t simply use your frontend code and in your backend. And yes, of course I hear the people screaming JAVASCRIPT, but common... really?\nSo let me take on this crazy quest I have been on ever since I started coding more than 10 years ago of finding my Holy Grail of coding and how I finally did. 😎\nKind of... 😬\nSomewhat... 🥲\nJust let me explain 😅',
          participants: [1],
          startsAt: DateTime.now(),
          endsAt: DateTime.now(),
        ),
      };
}
