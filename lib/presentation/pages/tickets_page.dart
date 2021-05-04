import 'package:byte_adventures/presentation/helpers/size_sensitive_textstyle.dart';
import 'package:byte_adventures/presentation/widgets/embeded_i_frame.dart';
import 'package:byte_adventures/presentation/widgets/neon_decoration.dart';
import 'package:flutter/material.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Tickets',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context).textTheme.headline1!.resize(context),
            ),
            Container(
              margin: const EdgeInsets.all(24.0),
              constraints: const BoxConstraints(maxWidth: 900, maxHeight: 700),
              decoration: NeonDecoration.neonDecorationColor(context, decorationColor: Colors.white),
              child: const Iframe(iframeUrl: 'https://tickets.byte-adventures.com/'),
            ),
          ],
        ),
      );
}
