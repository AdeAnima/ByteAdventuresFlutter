enum Platform { github, gitlab, facebook, instagram, linkedIn, xing, twitter, spotify, blog }

class PlatformProfile {
  final Uri profileUrl;
  final Platform platform;

  PlatformProfile({required this.profileUrl, required this.platform});
}
