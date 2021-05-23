import 'dart:html';

import 'package:byte_adventures/presentation/widgets/byte_overlayed_page.dart';
import 'package:byte_adventures/presentation/widgets/neon_decoration.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:byte_adventures/presentation/helpers/size_sensitive_textstyle.dart';

class AboutTheConference extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.of(context).size.width;
    final wrapWidth = 1180 - 80;
    final definitionWidth = windowWidth > 740 ? wrapWidth / 3 - (3 * 40) : wrapWidth * 0.9;

    return ByteOverlayedPage(
        pageName: 'B8+ 2021',
        socialIconsOverlay: Overlaydefinition(),
        pageContent: Padding(
          padding: EdgeInsets.all(windowWidth > 740 ? 40 : 20),
          child: Row(
            children: [
              Wrap(
                spacing: 40.0,
                children: [
                  DetailsWrapper(
                    width: definitionWidth,
                    child: const ByteAdventuresDetails(
                      headerWidget: SizedBox(),
                      headerText: 'Digital native',
                      description:
                          'To still have a community experience the event itself will take place in a world we create together with anyone that wants to contribute on https://gather.town - for now this is only for the conference but we envision to have Gather or a similar solution as a permanent place for the community to come together. Short term outside of the events we will get together on discord to exchange there.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class DetailsWrapper extends StatelessWidget {
  final double width;
  final Widget child;

  const DetailsWrapper({
    required this.width,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: width * 1.618,
        child: Center(
          child: child,
        ),
      );
}

class ByteAdventuresDetails extends StatelessWidget {
  final Widget headerWidget;
  final String headerText;
  final String description;

  const ByteAdventuresDetails({
    required this.headerWidget,
    required this.headerText,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Column(children: [
            Flexible(
              child: Container(
                decoration: NeonDecoration.neonDecorationImage(context),
                child: headerWidget,
              ),
            )
          ]),
          const SizedBox(height: 16),
          Row(children: [
            Flexible(
              child: Text(
                headerText,
                style: Theme.of(context).textTheme.headline4?.resize(context),
                maxLines: 1,
              ),
            )
          ]),
          const SizedBox(height: 8),
          Row(
            children: [
              Flexible(
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.caption,
                  softWrap: true,
                ),
              )
            ],
          )
        ],
      );
}

class VideoWidget extends StatefulWidget {
  final String source;
  final bool loop;
  final double? overWriteAspectRatio;

  const VideoWidget({
    required this.source,
    this.loop = false,
    this.overWriteAspectRatio,
    Key? key,
  }) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.source)
      ..setLooping(widget.loop)
      ..setVolume(0.0)
      ..play()
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) => _controller.value.isInitialized
      ? AspectRatio(
          aspectRatio: 1.618,
          child: ClipRect(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                height: _controller.value.size.height,
                width: _controller.value.size.width,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
        )
      : Container();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
