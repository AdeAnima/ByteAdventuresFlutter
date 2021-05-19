import 'package:byte_adventures/generated/l10n.dart';
import 'package:byte_adventures/presentation/helpers/size_sensitive_textstyle.dart';
import 'package:byte_adventures/presentation/widgets/mascot_animation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingPage extends StatelessWidget {
  final VoidCallback goDownCallback;

  const LandingPage({
    required this.goDownCallback,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final windowWidth = MediaQuery.of(context).size.width;
    final daysLeft = DateTime(2021, 6, 24).difference(DateTime.now()).inDays;

    return Container(
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
              'June 24th & 25th 2021',
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
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    S.of(context).iNeedAName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6!.resize(context),
                  ),
                ),
              );
            },
            child: AnimatedAlign(
              duration: const Duration(seconds: 1),
              alignment: Alignment(windowWidth > 1000 ? -0.75 : -0.9, windowWidth > 1000 ? 0.1 : 0.25),
              child: SizedBox(
                height: windowWidth > 1000 ? 300 : 150,
                width: windowWidth > 1000 ? 300 : 150,
                child: const MascotAnimation(),
              ),
            ),
          ),
          Flexible(
            child: Text(
              '$daysLeft Days left, get your ticket:',
              textAlign: TextAlign.center,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline2!.resize(context),
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
}
