import 'package:byte_adventures/domain/platform_profile.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlattformIcon extends StatelessWidget {
  final Platform platform;
  const PlattformIcon({
    required this.platform,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (platform) {
      case Platform.xing:
        return const FaIcon(FontAwesomeIcons.xingSquare);
      case Platform.facebook:
        return const FaIcon(FontAwesomeIcons.facebookSquare);
      case Platform.github:
        return const FaIcon(FontAwesomeIcons.githubSquare);
      case Platform.gitlab:
        return const FaIcon(FontAwesomeIcons.gitlab);
      case Platform.linkedIn:
        return const FaIcon(FontAwesomeIcons.linkedin);
      case Platform.instagram:
        return const FaIcon(FontAwesomeIcons.instagram);
      case Platform.spotify:
        return const FaIcon(FontAwesomeIcons.spotify);
      case Platform.twitter:
        return const FaIcon(FontAwesomeIcons.twitter);
      case Platform.blog:
      default:
        return const FaIcon(FontAwesomeIcons.globe);
    }
  }
}
