import 'package:byte_adventures/presentation/widgets/neon_glow_shadow.dart';
import 'package:flutter/material.dart';

class GlowingButton extends StatefulWidget {
  final Color? color1;
  final Color? color2;
  final String buttonText;

  const GlowingButton({required this.buttonText, Key? key, this.color1, this.color2}) : super(key: key);

  @override
  _GlowingButtonState createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton> {
  bool glowing = true;
  double scale = 1.0;

  @override
  Widget build(BuildContext context) {
    final color1 = widget.color1 ?? Theme.of(context).accentColor;
    final color2 = widget.color2 ?? Theme.of(context).buttonColor;
    return GestureDetector(
      onTapUp: (val) {
        setState(() {
          glowing = false;
          scale = 1.0;
        });
      },
      onTapDown: (val) {
        setState(() {
          glowing = true;
          scale = 1.1;
        });
      },
      child: AnimatedContainer(
        transform: Matrix4.identity()..scale(scale),
        duration: const Duration(milliseconds: 200),
        height: 48,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: LinearGradient(
              colors: [
                color1,
                color2,
              ],
            ),
            boxShadow: glowing ? NeonGlowShadow.themeGlow(context) : []),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(widget.buttonText, style: Theme.of(context).textTheme.button)],
        ),
      ),
    );
  }
}
