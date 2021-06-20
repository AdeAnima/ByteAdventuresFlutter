import 'dart:math';

import 'package:byte_adventures/presentation/widgets/embeded_i_frame.dart';
import 'package:flutter/material.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage({Key? key}) : super(key: key);

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
                    width: min(800, MediaQuery.of(context).size.width - 64 * 2),
                    child: Iframe(
                      iframeUrl:
                          'https://docs.google.com/spreadsheets/d/e/2PACX-1vSkiIaO3QtUQ5scQphPs5UKqI9ENs2M1T1Ak6yEfCeOzTukb0duTQrKtwk0GlqB2wKK-Ap9nKDrGXub/pubhtml?gid=358977194&amp;single=true&amp;widget=true&amp;headers=false',
                      iframeHeight: MediaQuery.of(context).size.height.toInt(),
                      iframeWidth: min(800, MediaQuery.of(context).size.width - 64 * 2).toInt(),
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
