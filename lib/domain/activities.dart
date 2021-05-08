abstract class Activity {
  final String name;
  final Uri picture;
  final Uri link;
  final String shortDescription;

  Activity({
    required this.name,
    required this.picture,
    required this.link,
    required this.shortDescription,
  });
}

class JobAtCompany extends Activity {
  final String title;

  JobAtCompany({
    required this.title,
    required String companyName,
    required Uri companyLogo,
    required Uri homepage,
    required String description,
  }) : super(
          name: companyName,
          picture: companyLogo,
          link: homepage,
          shortDescription: description,
        );
}

class PersonalInterest extends Activity {
  PersonalInterest({
    required String activity,
    required Uri pictureUrl,
    required Uri homepage,
    required String description,
  }) : super(
          name: activity,
          picture: pictureUrl,
          link: homepage,
          shortDescription: description,
        );
}
