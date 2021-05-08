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
          pictureHash:
              '|JD[,?4:~AR+WExuNHn%R+0fWrIVNH%1jZNHoJWXR*bba}oyNHoKs:jZoKoJt6ofsmNaoLoLofayR+s9oLs.e.WVR*oeWCR*bIj]R,W=ayoekCa#R*bIayoeWBWBoLj[oLoLaea}oLjZj[WVoLjZj[fRWqWVofj[WqWVj[',
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
          pictureHash:
              '|pLNS%flpIxui_ogayayoz~Wazo#bHWBf6V@WBfkNdj[aJf6bbayj]a}jZNHofs:j[j[WBkCkCf5t7fkjsayRjayofj[jsWVj[j[j@WVayofj[ayt6j[WBaykCWBofj[WBofayo1f6WBayj[j[f6t7ofWBayoeoLazj[j[',
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
          pictureHash:
              '|fL-;gt7}aNas.jZWBxZs:].son%bHNaofWVWBoL=|flJ7oLR*WBs:S2oLI:R*WVoLxGoLs:fkR*\$+f6WUjuWWofW.R*R*WVs:oLWVoLR*WUoLoMspR*R*bHoLoLoLsoayWCofoff6aef6bHa}ays.aeWCs:s:WVR*a{oL',
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
          pictureHash:
              '|MK^vpo~Tx-pVs_2NG%LSO={Rj%LxZR*t7RjflfO_Moen3WEW=9Zt7M{WA-oxuIpM{s:M|t7ofogx]M{RjRjWUsoaeW;oLxZj[V[R+t7WUt6s.j[nOofIpWBxat7a#bIWBV@V@oyozofxaV[R*WCE2j[%2xaWVWBR*jbof',
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
          pictureHash:
              '|JI|aX0L0f~UnP9a%L%1enV@tQxGEMbboLRkWBfk-naz={9HM|%1RQt7NIE1xaWBxZj[t6ofRjWV%LWWS2NHM|%LWBIpxtW.WVRkxtt6V[s.s.ae-os:NGoLjZNHbHWXoe-oRjNHxZoeWBkBWCn\$xZt6NHoKjZR+j@a{a}',
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
          pictureHash:
              '|EF;.v9a0L~B^QE2oKkWNHWBjuofNHoft6Rjs:kC0MoJ-AR+NGt6R*aexZIofl-UoeE2j[t7RkoL9bxa={IpRks.ofWBoL-oNGR*xaNGay%1NGay9ut6-UNGR+t6WCoeoL%2jtIpj[%1RkR*offk%1RkNHoKNHj@xFR+WW',
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
          pictureHash:
              '|WM7GgIU?wWUt8%MRiR+s:-oe.WXt7n\$j[kWa#WCNGWBs.t6ofRkWCofjtjFWCWBayozjtaeofWVn\$RjRkkCs-oebHayflWBWBjYoKa}WVj]j[jZRjays:WBRjoLofkCofs:j[R+WBjZjZj?fkWVbbayjZj[afayWVayoe',
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
          pictureHash:
              '|hKde]%M?^x]-pt8ShkCoM_2kDt7WAM{V@RjWAaypIRienoKIUR*t6oft7tRjus:WBayj[ofofj[xuWBM{j[j[oLt7WVR*ofaejZaybHofs:flaytRfkV@j]fkWBa#axWBofj]WBayofoLWVayf6t7j[RjWVofj[j[j[WV',
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
          pictureHash:
              '|MH2TJD%?^-V%1IVM{t6NG_3M{ozWBV[fQR*ayay9axueTR*NGt7t7j[xa%faet6R*RjWCoLj[ofRkWBV@bHWqt6t6WBayxut6Rjj[ayWBt7WBWBozRjWBWVofofWBj[jYt6kCNGt7s:j[ayWBWB%2WURjaefQWBofj[WC',
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
          pictureHash:
              '|YL44vo#?]M|xbxtofxuaf^+V@EMt6aLWXayf6ofkpoyaKj[nhaebFaebIR%Rkniogt6kCbbj@WBxtt6RkRjWBoJofWVaxfhaejEaybbjZkCW.j[RjW=M|ofofaej[WBazj=WBoJjZWCR*WBs:oKR.jst7bIfkofayoMay',
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
          pictureHash:
              '|AD,498x7oV~4:D%9[xo=y??w|0f.8MKWA^*s9-pw|5Q^QW-E1-po#NKW?13WZw[\$fTD-prt9abc58Nw=y-oROIoxbIVI:-:Mxn+%MEMIoxvslngob%1D%kXx]I=xZxFIUVsR%%MIot8jbR%xGaxWTohS1jZjExuIVbHxu',
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
          pictureHash:
              '|aIYIUR*ysoes9jso~s:xu?ws.ELWVQ-a}Rjayaew]WXMxj?R*aet7ofbH4.oKs-WC%Mj]ofWVV@xuWCe.oeWVoLWBjsWBNxoen~WVaea}kCWBj?s:WWV@jsbIf6ofofWBM|j@s:fQogfkaeayaekCaye.j[bIj[e.j[ay',
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
          pictureHash:
              '|EE.w\$_4~qDj~VI=oyaJM{9vkYEl^+aiI;R*xaoINZM|WB%1\$%%2RjxtWBo|W=M|Ipt7ogofRks:ngw[\$%xtbHR*RkofbIIpR,WENcI:Rjt6R*WVx]%2\$%M|WBxFxZNGa}ENIqt7NGR*\$*jFWVaxM{%0xYxaR*t6j]R*j[',
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
          pictureHash:
              '|iHoLRMx%%jZxut7M{NGoL?cWVkro#aJofWBoJofbwt7n3oJM{RiozWUbbbwS2j[axS4aet7ofn\$t7oJn\$j]WBWXkCozR*X9bIWBjYbIWBs:oLWBs;aye.ayj]bIkCofWBkDjsjZjZbHj@aefkj@f,bHaeayofa#ayf6j[',
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
          pictureHash:
              '|kK-LK-p.RRjnObbkCoeof~WR*I;n%RPt7W;ofofRjWBjZofbHaxjZWBWVNat7xZWBW;WBoLj[j@kWayn\$WCWVs:j[ayWBxtayWBofWVj[ofWBayoMWVays:ayWBofa|ayj[j[jsaybHf6oLj[WBkCfke.ayj[oeayWVay',
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
