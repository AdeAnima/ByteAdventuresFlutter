import 'package:byte_adventures/infrastructure/helpers.dart';
import 'package:flutter/material.dart';
import 'package:byte_adventures/presentation/helpers/size_sensitive_textstyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingPage extends StatelessWidget {
  final VoidCallback goDownCallback;
  final double windowHeight;

  const LandingPage({
    required this.windowHeight,
    required this.goDownCallback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset('assets/images/background.png').image,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 3,
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
            Flexible(
              child: Text(
                'May 24th & 25th 2021',
                style: Theme.of(context).textTheme.headline3!.resize(context),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              child: Text(
                'ByteAdventures',
                style: Theme.of(context).textTheme.headline1!.resize(context),
                maxLines: 3,
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              child: Text(
                'Share your excitement.',
                maxLines: 1,
                style: Theme.of(context).textTheme.headline4!.resize(context),
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              child: Text(
                'Shape the community.',
                maxLines: 1,
                style: Theme.of(context).textTheme.headline4!.resize(context),
                textAlign: TextAlign.center,
              ),
            ),
            Flexible(
              child: Text(
                'Join ByteAdventures.',
                maxLines: 1,
                style: Theme.of(context).textTheme.headline4!.resize(context),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(flex: 3),
            Flexible(
              child: Text(
                '20 Days left, get your ticket:',
                textAlign: TextAlign.center,
                maxLines: 1,
                style: Theme.of(context).textTheme.headline3!.resize(context),
              ),
            ),
            Flexible(
              child: IconButton(
                tooltip: 'Get Ticket',
                icon: const Icon(
                  // Icons.expand_more_outlined,
                  FontAwesomeIcons.ticketAlt,
                  size: 24,
                ),
                onPressed: goDownCallback,
              ),
            ),
            const Spacer(),
            const SizedBox(height: 40),
          ],
        ),
      );
}
