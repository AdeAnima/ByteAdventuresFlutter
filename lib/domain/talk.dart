class CodeLang {
  final String name;

  CodeLang({required this.name});
}

class Talk {
  final String title;
  final CodeLang? codeLang;
  final List<String> keywords;
  final String shortAbstract;
  // final Uri pitchVideoUrl;
  final DateTime startsAt;
  final DateTime endsAt;
  final List<int> participants;

  Talk({
    required this.title,
    required this.keywords,
    required this.shortAbstract,
    required this.startsAt,
    required this.endsAt,
    required this.participants,
    this.codeLang,
    // required this.pitchVideoUrl,
  });
}
