import 'dart:math';

import 'package:byte_adventures/domain/participant.dart';
import 'package:byte_adventures/infrastructure/helpers.dart';
import 'package:byte_adventures/presentation/widgets/neon_decoration.dart';
import 'package:byte_adventures/presentation/widgets/platform_profile_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SpeakerPage extends StatelessWidget {
  final Participant speaker;

  const SpeakerPage({
    required this.speaker,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: SizedBox(
            height: 32,
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    width: min(420, MediaQuery.of(context).size.width - 64 * 2),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),
                        Container(
                          decoration: NeonDecoration.neonDecorationImage(
                            context,
                            decorationImage: DecorationImage(
                              image: Image.network(
                                speaker.pictureUrl.toString(),
                              ).image,
                              fit: BoxFit.cover,
                              alignment: speaker.pictureAligment,
                            ),
                          ),
                          child: AspectRatio(
                            aspectRatio: 0.618,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                gradient: const LinearGradient(
                                  colors: [Colors.transparent, Colors.black87],
                                  begin: Alignment.center,
                                  end: Alignment.centerLeft,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        RotatedBox(
                                          quarterTurns: 1,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                speaker.firstName,
                                                style: Theme.of(context).textTheme.headline1,
                                                maxLines: 2,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    if (speaker.profiles.isEmpty)
                                      Container()
                                    else
                                      SizedBox(
                                        height: 32,
                                        child: ListView.separated(
                                          separatorBuilder: (context, index) => const SizedBox(width: 8),
                                          clipBehavior: Clip.antiAlias,
                                          cacheExtent: 20.0,
                                          scrollDirection: Axis.horizontal,
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          itemCount: speaker.profiles.length,
                                          itemBuilder: (context, index) =>
                                              PlatformProfileButton(platformProfile: speaker.profiles[index]),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          speaker.job.title,
                          style: Theme.of(context).textTheme.headline4,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 8),
                        Text.rich(
                          TextSpan(
                            text: speaker.job.name,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                openURL(speaker.job.link.toString());
                              },
                            style: Theme.of(context).textTheme.headline3!.copyWith(
                                  color: Theme.of(context).accentColor,
                                  decoration: TextDecoration.underline,
                                ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          speaker.shortBio,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),
                  const Spacer()
                ],
              ),
            ],
          ),
        ),
      );
}
