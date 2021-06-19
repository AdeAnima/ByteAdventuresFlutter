import 'package:byte_adventures/infrastructure/helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaIconRow extends StatelessWidget {
  const SocialMediaIconRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.discord),
            onPressed: () {
              openURL('https://discord.gg/grpBnjRfP8');
            },
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.twitterSquare),
            onPressed: () {
              openURL('https://twitter.com/byte_adventures');
            },
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.instagramSquare),
            onPressed: () {
              openURL('https://www.instagram.com/byte_adventures/');
            },
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.linkedin),
            onPressed: () {
              openURL('https://www.linkedin.com/events/byteadventures-conference20216778733206616215553/');
            },
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.spotify),
            onPressed: () {
              openURL('https://open.spotify.com/user/prip5qu3ak?si=1f865b0510324c21');
            },
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.envelopeSquare),
            onPressed: () {
              openURL('mailto:info@byte-ad.ventures');
            },
          ),
        ],
      );
}
