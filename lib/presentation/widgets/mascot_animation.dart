import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class MascotAnimation extends StatefulWidget {
  const MascotAnimation({Key? key}) : super(key: key);

  @override
  _MascotAnimationState createState() => _MascotAnimationState();
}

class _MascotAnimationState extends State<MascotAnimation> {
  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard? _riveArtboard;
  RiveAnimationController? _controller;
  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/animations/mascot.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard..addController(_controller = SimpleAnimation('Animation 1'));
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) => Center(
        child: _riveArtboard == null ? const SizedBox() : Rive(artboard: _riveArtboard!),
      );
}
