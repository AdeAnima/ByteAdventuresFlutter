import 'dart:math';

import 'package:byte_adventures/domain/activities.dart';
import 'package:byte_adventures/domain/i_speaker_repository.dart';
import 'package:byte_adventures/domain/participant.dart';
import 'package:byte_adventures/domain/platform_profile.dart';
import 'package:flutter/material.dart';

class StaticSpeakerRepository implements ISpeakerRepository {
  @override
  List<Participant> get speakers => [
        Participant(
          firstName: 'Martin',
          lastName: 'Westphal',
          pictureUrl: Uri.file('assets/assets/images/people/martin_westphal.jpeg'),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/ade-anima/'),
              platform: Platform.linkedIn,
            ),
            PlatformProfile(
              profileUrl: Uri.parse('https://twitter.com/AdeAnima'),
              platform: Platform.twitter,
            ),
            PlatformProfile(
              profileUrl: Uri.parse('https://github.com/adeanima'),
              platform: Platform.github,
            ),
            PlatformProfile(
              profileUrl: Uri.parse('https://www.xing.com/profile/Martin_Westphal31'),
              platform: Platform.xing,
            ),
            PlatformProfile(
              profileUrl: Uri.parse('https://martin.westphal.pw/'),
              platform: Platform.blog,
            ),
          ],
          job: JobAtCompany(
            title: 'co-Funder & CTO',
            companyName: 'yamuntu GmbH',
            companyLogo: Uri.parse(
              'https://firebasestorage.googleapis.com/v0/b/b8adventures.appspot.com/o/participants%2Falexander_jäger.jpeg?alt=media&token=13aac7bc-9728-4174-a7e0-ca295c24f702',
            ),
            homepage: Uri.parse('https://app.yamuntu.com'),
            description: 'Show what you stand for!',
          ),
        ),
        Participant(
          firstName: 'Alexander',
          lastName: 'Jäger',
          pictureUrl: Uri.file('assets/images/people/alexander_jager.jpeg'),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/lxhunter/'),
              platform: Platform.linkedIn,
            ),
          ],
          job: JobAtCompany(
            title: 'CEO',
            companyName: 'THE FITTEST',
            companyLogo: Uri.parse('https://the-fittest.de/wp-content/uploads/2020/06/cropped-logo-2.png'),
            homepage: Uri.parse('https://the-fittest.de'),
            description: 'WE ARE TECH!',
          ),
        ),
        Participant(
          firstName: 'Aya',
          lastName: 'Jaff',
          pictureUrl: Uri.file('assets/assets/images/people/aya_jaff.jpg'),
          job: JobAtCompany(
              title: 'Founder & Author',
              companyName: 'Aya Jaff',
              companyLogo: Uri.file(''),
              homepage: Uri.parse('https://www.ayajaff.com'),
              description: 'Let\'s talk social change, tech, sustainability and politics.'),
          profiles: [
            PlatformProfile(profileUrl: Uri.parse('https://www.linkedin.com/in/ayajaff/'), platform: Platform.linkedIn),
            PlatformProfile(profileUrl: Uri.parse('https://twitter.com/ayadoingthings'), platform: Platform.twitter),
            PlatformProfile(profileUrl: Uri.parse('https://www.instagram.com/ayajaff/'), platform: Platform.instagram),
          ],
        ),
        Participant(
          firstName: 'Chris',
          lastName: 'Springer',
          pictureUrl: Uri.file('assets/images/people/christoph_spinger.jpg'),
          pictureAligment: const Alignment(-0.4, 0.0),
          job: JobAtCompany(
              title: 'Cofounder',
              companyName: 'VR Nerds',
              companyLogo: Uri.file(''),
              homepage: Uri.parse('https://www.vrnerds.de'),
              description: 'A VIRTUAL REALITY SHOWCASE'),
          profiles: [],
        ),
        Participant(
          firstName: 'Ellen',
          lastName: 'Schwartau',
          pictureUrl: Uri.file('assets/assets/images/people/ellen_schwartau.jpg'),
          pictureAligment: const Alignment(0.0, 0.0),
          job: JobAtCompany(
              title: 'Technologist',
              companyName: 'Orbit',
              companyLogo: Uri.file(''),
              homepage: Uri.parse('https://www.orbitdigital.de'),
              description: 'We change the game of corporate venturing'),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/ellen-schwartau-b53aa5133/'),
              platform: Platform.linkedIn,
            ),
          ],
        ),
        Participant(
          firstName: 'Finn',
          lastName: 'Lorbeer',
          pictureUrl: Uri.file('assets/assets/images/people/finn_lorbeer.jpg'),
          job: JobAtCompany(
              title: 'Director of Engineering',
              companyName: 'MOIA',
              companyLogo: Uri.file(''),
              homepage: Uri.parse('https://www.moia.io'),
              description: 'Arrival begins here'),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/lorbeer/'),
              platform: Platform.linkedIn,
            ),
          ],
        ),
        Participant(
          firstName: 'Julia',
          lastName: 'Heidinger',
          pictureUrl: Uri.file('assets/assets/images/people/julia_heidinger.jpg'),
          pictureAligment: const Alignment(-0.1, 0.0),
          job: JobAtCompany(
            title: 'Co-Founder',
            companyName: 'Social Developers Club',
            companyLogo: Uri.file(''),
            homepage: Uri.parse('https://socialdevelopersclub.de'),
            description:
                'International network for devs and people interested in tech. We aim to take down barriers for programming & technology.',
          ),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/julia-alexandra-heidinger-461875140/'),
              platform: Platform.linkedIn,
            ),
          ],
        ),
        Participant(
          firstName: 'Katerina',
          lastName: 'Trajchevska',
          pictureUrl: Uri.file('assets/assets/images/people/katerina_trajchevska.jpg'),
          job: JobAtCompany(
            title: 'Co-Founder, CEO, Senior Software Developer',
            companyName: 'Adeva',
            companyLogo: Uri.file(''),
            homepage: Uri.parse('https://adevait.com'),
            description:
                'We help companies build high-performing, distributed engineering teams with world-class software engineers',
          ),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/trajchevska/'),
              platform: Platform.linkedIn,
            ),
          ],
        ),
        Participant(
          firstName: 'Lars',
          lastName: 'Wolff',
          pictureUrl: Uri.file('assets/assets/images/people/lars_wolff.jpg'),
          job: JobAtCompany(
            title: 'Co-Founder & CEO',
            companyName: 'StormForger GmbH',
            companyLogo: Uri.file(''),
            homepage: Uri.parse('https://stormforger.com'),
            description: 'Load & Performance Testing for #DevOps in the #Cloud',
          ),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/larswolffstormforger/'),
              platform: Platform.linkedIn,
            ),
          ],
        ),
        Participant(
          firstName: 'Nils',
          lastName: 'Eckelt',
          pictureUrl: Uri.file('assets/assets/images/people/nils_eckelt.jpg'),
          pictureAligment: const Alignment(-0.2, 0.0),
          job: JobAtCompany(
            title: 'Senior Consultant',
            companyName: 'CGI',
            companyLogo: Uri.file(''),
            homepage: Uri.parse('https://www.cgi.com'),
            description: 'Insights you can act on',
          ),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/nils-eckelt/'),
              platform: Platform.linkedIn,
            ),
          ],
        ),
        Participant(
          firstName: 'Simon',
          lastName: 'Graff',
          pictureUrl: Uri.file('assets/assets/images/people/simon_graff.jpeg'),
          job: JobAtCompany(
            title: 'XR Professional & Consultant',
            companyName: 'Simon Graff',
            companyLogo: Uri.file(''),
            homepage: Uri.parse('https://simongraff.de'),
            description: 'Extended Reality Specalist',
          ),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('http://www.linkedin.com/in/simon-graff'),
              platform: Platform.linkedIn,
            ),
          ],
        ),
        Participant(
          firstName: 'Stefan',
          lastName: 'Richter',
          pictureUrl: Uri.file('assets/assets/images/people/stefan_richter.jpg'),
          job: JobAtCompany(
            title: 'Founder',
            companyName: 'freiheit.com',
            companyLogo: Uri.file(''),
            homepage: Uri.parse('https://freiheit.com/'),
            description: 'LET\'S SHAPE TOMORROW. TOGETHER.',
          ),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/smartrevolution/'),
              platform: Platform.linkedIn,
            ),
          ],
        ),
        Participant(
          firstName: 'Tam',
          lastName: 'Hanna',
          pictureUrl: Uri.file('assets/assets/images/people/tam_hanna.jpg'),
          pictureAligment: const Alignment(-0.05, 0.0),
          job: JobAtCompany(
            title: 'Founder',
            companyName: 'Tamoggemon Software and Computer Software Consultant',
            companyLogo: Uri.file(''),
            homepage: Uri.parse('https://www.linkedin.com/in/ing-tam-hanna-5186273/'),
            description: '',
          ),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/ing-tam-hanna-5186273/'),
              platform: Platform.linkedIn,
            ),
          ],
        ),
        Participant(
          firstName: 'Tereza',
          lastName: 'Iofciu',
          pictureUrl: Uri.file('assets/assets/images/people/tereza_iofciu.jpg'),
          pictureAligment: const Alignment(-0.4, 0.0),
          job: JobAtCompany(
            title: 'Head Data Science Coach',
            companyName: 'neuefische',
            companyLogo: Uri.file(''),
            homepage: Uri.parse('https://www.neuefische.de'),
            description: 'The time is now. Educate yourself or your workforce to be prepared for a digital future!',
          ),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/tereza-iofciu/'),
              platform: Platform.linkedIn,
            ),
          ],
        ),
        Participant(
          firstName: 'Vladyslav',
          lastName: 'Cherednychenko',
          pictureUrl: Uri.file('assets/assets/images/people/vladyslav_cherednychenko.jpg'),
          job: JobAtCompany(
            title: 'Lead Security Engineer',
            companyName: 'About You',
            companyLogo: Uri.file(''),
            homepage: Uri.parse('https://corporate.aboutyou.de/en/'),
            description: 'The most Inspiring and Personal Fashion Online Shop in Europe',
          ),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/vladyslav-cherednychenko-55612487/'),
              platform: Platform.linkedIn,
            ),
          ],
        ),
      ]..shuffle(Random());
}
