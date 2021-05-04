class Company {
  // static Map<String, List<Participant>> employees = {};

  final String name;
  final Uri logoUrl;
  final Uri homepageUrl;
  final Uri hiringUrl;

  Company({
    required this.name,
    required this.logoUrl,
    required this.homepageUrl,
    required this.hiringUrl,
  });

  // int get employeesAttendingCount => employees[name];

  // void relateEmployee(Participant participant) => employees[name]!.add(participant);
}
