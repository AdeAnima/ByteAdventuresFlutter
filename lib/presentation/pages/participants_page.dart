import 'package:byte_adventures/infrastructure/static_speaker_repository.dart';
import 'package:byte_adventures/presentation/helpers/size_sensitive_textstyle.dart';
import 'package:byte_adventures/presentation/widgets/participant_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ParticipantsPage extends StatelessWidget {
  const ParticipantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final windowHeight = MediaQuery.of(context).size.height;
    final windowWidth = MediaQuery.of(context).size.width;
    final participants = StaticSpeakerRepository().speakers;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Speakers',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: Theme.of(context).textTheme.headline1!.resize(context),
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: windowHeight / 1.5,
              minWidth: double.infinity,
            ),
            child: CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: windowWidth > 800 ? 0.5 : 0.7,
                aspectRatio: windowWidth > 800 ? 16 / 9 : 1 / 1,
              ),
              itemCount: participants.length,
              itemBuilder: (context, index, _) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 40.0,
                ),
                child: ParticipantCard(participant: participants[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
