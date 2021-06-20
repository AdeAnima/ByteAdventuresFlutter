import 'package:byte_adventures/domain/platform_profile.dart';
import 'package:byte_adventures/infrastructure/helpers.dart';
import 'package:byte_adventures/presentation/widgets/platform_icon.dart';
import 'package:flutter/material.dart';

class PlatformProfileButton extends StatelessWidget {
  final PlatformProfile platformProfile;

  const PlatformProfileButton({
    required this.platformProfile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () => openURL(platformProfile.profileUrl.toString()),
        icon: PlattformIcon(platform: platformProfile.platform),
      );
}
