import 'package:byte_adventures/domain/activities.dart';
import 'package:byte_adventures/domain/i_speaker_repository.dart';
import 'package:byte_adventures/domain/participant.dart';
import 'package:byte_adventures/domain/platform_profile.dart';
import 'package:flutter/material.dart';

class StaticSpeakerRepository implements ISpeakerRepository {
  @override
  Map<int, Participant> get speakers => {
        1: Participant(
          firstName: 'Martin',
          lastName: 'Westphal',
          talkId: 1,
          shortBio:
              'Martin Westphal is a Nerd by heart, loves challenges of any kind and is a firm believer that most people are capable of way more than they believe, if you give them the chance and encourage them. As the co-founder & CTO of the yamuntu GmbH, leader & co-founder of the byteAdventures Community, founder of the Hamburg Dart, Firebase and byteAdventures Meetups, he is trying to help people achieve more and believe in themselves, to create great things with technology.',
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
        2: Participant(
          firstName: 'Alexander',
          lastName: 'Jaeger',
          pictureUrl: Uri.parse(
              'https://firebasestorage.googleapis.com/v0/b/b8adventures.appspot.com/o/participants%2Falexander_jaeger.jpeg?alt=media&token=eff9d90a-80b0-4929-8a2b-265e48a0ed21'),
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
        3: Participant(
          firstName: 'Aya',
          lastName: 'Jaff',
          pictureUrl: Uri.parse('assets/assets/images/people/aya_jaff.jpg'),
          shortBio:
              'Forbes30under30 entrepreneur with a passion for tech and finance. I\'ve worked as a software developer for various startups and companies (e.g. Hyperloop) in the Bay area. My book "Moneymakers" [SPIEGEL BESTSELLER] sums up my experience building the biggest social stock market game in Germany and explains Wall Street as simple as possible.',
          pictureHash:
              '|fL-;gt7}aNas.jZWBxZs:].son%bHNaofWVWBoL=|flJ7oLR*WBs:S2oLI:R*WVoLxGoLs:fkR*\$+f6WUjuWWofW.R*R*WVs:oLWVoLR*WUoLoMspR*R*bHoLoLoLsoayWCofoff6aef6bHa}ays.aeWCs:s:WVR*a{oL',
          job: JobAtCompany(
              title: 'Founder & Author',
              companyName: 'Aya Jaff',
              companyLogo: Uri.parse(''),
              homepage: Uri.parse('https://www.ayajaff.com'),
              description: 'Let\'s talk social change, tech, sustainability and politics.'),
          profiles: [
            PlatformProfile(profileUrl: Uri.parse('https://www.linkedin.com/in/ayajaff/'), platform: Platform.linkedIn),
            PlatformProfile(profileUrl: Uri.parse('https://twitter.com/ayadoingthings'), platform: Platform.twitter),
            PlatformProfile(profileUrl: Uri.parse('https://www.instagram.com/ayajaff/'), platform: Platform.instagram),
          ],
        ),
        4: Participant(
          firstName: 'Chris',
          lastName: 'Springer',
          shortBio:
              'Christoph Spinger is co-founder of VR-Nerds, which has been working with VR glasses and software since 2013. He is currently working on the further development of VR-Nerds.de and on an Oculus Quest port of Tower Tag.',
          pictureUrl: Uri.parse(
              'https://firebasestorage.googleapis.com/v0/b/b8adventures.appspot.com/o/participants%2Fchristoph_spinger.jpg?alt=media&token=989c9c25-ab9b-4e06-b7bc-ac9b8591e125'),
          pictureHash:
              '|MK^vpo~Tx-pVs_2NG%LSO={Rj%LxZR*t7RjflfO_Moen3WEW=9Zt7M{WA-oxuIpM{s:M|t7ofogx]M{RjRjWUsoaeW;oLxZj[V[R+t7WUt6s.j[nOofIpWBxat7a#bIWBV@V@oyozofxaV[R*WCE2j[%2xaWVWBR*jbof',
          pictureAligment: const Alignment(-0.4, 0.0),
          job: JobAtCompany(
              title: 'Cofounder',
              companyName: 'VR Nerds',
              companyLogo: Uri.parse(''),
              homepage: Uri.parse('https://www.vrnerds.de'),
              description: 'A VIRTUAL REALITY SHOWCASE'),
          profiles: [],
        ),
        5: Participant(
          firstName: 'Ellen',
          lastName: 'Schwartau',
          shortBio:
              'Became a developer by accident, loving it now. Masters dregree in Computer Science, followed by 5+ years of experience as Software Developer. Food is nice, too.',
          pictureUrl: Uri.parse('assets/assets/images/people/ellen_schwartau.jpg'),
          pictureHash:
              '|JI|aX0L0f~UnP9a%L%1enV@tQxGEMbboLRkWBfk-naz={9HM|%1RQt7NIE1xaWBxZj[t6ofRjWV%LWWS2NHM|%LWBIpxtW.WVRkxtt6V[s.s.ae-os:NGoLjZNHbHWXoe-oRjNHxZoeWBkBWCn\$xZt6NHoKjZR+j@a{a}',
          pictureAligment: const Alignment(0.0, 0.0),
          job: JobAtCompany(
              title: 'Technologist',
              companyName: 'Orbit',
              companyLogo: Uri.parse(''),
              homepage: Uri.parse('https://www.orbitdigital.de'),
              description: 'We change the game of corporate venturing'),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/ellen-schwartau-b53aa5133/'),
              platform: Platform.linkedIn,
            ),
          ],
        ),
        6: Participant(
          firstName: 'Finn',
          lastName: 'Lorbeer',
          pictureUrl: Uri.parse('assets/assets/images/people/finn_lorbeer.jpg'),
          pictureHash:
              '|EF;.v9a0L~B^QE2oKkWNHWBjuofNHoft6Rjs:kC0MoJ-AR+NGt6R*aexZIofl-UoeE2j[t7RkoL9bxa={IpRks.ofWBoL-oNGR*xaNGay%1NGay9ut6-UNGR+t6WCoeoL%2jtIpj[%1RkR*offk%1RkNHoKNHj@xFR+WW',
          job: JobAtCompany(
              title: 'Director of Engineering',
              companyName: 'MOIA',
              companyLogo: Uri.parse(''),
              homepage: Uri.parse('https://www.moia.io'),
              description: 'Arrival begins here'),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/lorbeer/'),
              platform: Platform.linkedIn,
            ),
          ],
        ),
        7: Participant(
          firstName: 'Julia',
          lastName: 'Heidinger',
          pictureUrl: Uri.parse('assets/assets/images/people/julia_heidinger.jpg'),
          pictureHash:
              '|WM7GgIU?wWUt8%MRiR+s:-oe.WXt7n\$j[kWa#WCNGWBs.t6ofRkWCofjtjFWCWBayozjtaeofWVn\$RjRkkCs-oebHayflWBWBjYoKa}WVj]j[jZRjays:WBRjoLofkCofs:j[R+WBjZjZj?fkWVbbayjZj[afayWVayoe',
          pictureAligment: const Alignment(-0.1, 0.0),
          job: JobAtCompany(
            title: 'Co-Founder',
            companyName: 'Social Developers Club',
            companyLogo: Uri.parse(''),
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
        8: Participant(
          firstName: 'Katerina',
          lastName: 'Trajchevska',
          pictureUrl: Uri.parse('assets/assets/images/people/katerina_trajchevska.jpg'),
          pictureHash:
              '|hKde]%M?^x]-pt8ShkCoM_2kDt7WAM{V@RjWAaypIRienoKIUR*t6oft7tRjus:WBayj[ofofj[xuWBM{j[j[oLt7WVR*ofaejZaybHofs:flaytRfkV@j]fkWBa#axWBofj]WBayofoLWVayf6t7j[RjWVofj[j[j[WV',
          job: JobAtCompany(
            title: 'Co-Founder, CEO, Senior Software Developer',
            companyName: 'Adeva',
            companyLogo: Uri.parse(''),
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
        9: Participant(
          firstName: 'Lars',
          lastName: 'Wolff',
          shortBio:
              'Lars Wolff founded StormForger GmbH, a load and performance testing SaaS for agile and DevOps teams, with Sebastian Cohnen in 2014. In 2020, StormForger and the US company Carbon Relay merge to StormForge, combining load and performance testing with machine learning. \nLars career runs from product development to consulting and agile coaching to company formation. DevOps, Kanban, whiteboards and Post-it® are his passions.',
          pictureUrl: Uri.parse('assets/assets/images/people/lars_wolff.jpg'),
          pictureHash:
              '|MH2TJD%?^-V%1IVM{t6NG_3M{ozWBV[fQR*ayay9axueTR*NGt7t7j[xa%faet6R*RjWCoLj[ofRkWBV@bHWqt6t6WBayxut6Rjj[ayWBt7WBWBozRjWBWVofofWBj[jYt6kCNGt7s:j[ayWBWB%2WURjaefQWBofj[WC',
          job: JobAtCompany(
            title: 'Director Performance Testing',
            companyName: 'StormForge',
            companyLogo: Uri.parse(''),
            homepage: Uri.parse('https://www.stormforge.io/'),
            description: 'Load & Performance Testing for #DevOps in the #Cloud',
          ),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/larswolffstormforger/'),
              platform: Platform.linkedIn,
            ),
          ],
        ),
        10: Participant(
          firstName: 'Nils',
          lastName: 'Eckelt',
          shortBio:
              'Nils is interested in the design of things. Not how they look, but how they work. That\'s how he became a software developer. And UX designer. And product owner.',
          pictureUrl: Uri.parse('assets/assets/images/people/nils_eckelt.jpg'),
          pictureHash:
              '|YL44vo#?]M|xbxtofxuaf^+V@EMt6aLWXayf6ofkpoyaKj[nhaebFaebIR%Rkniogt6kCbbj@WBxtt6RkRjWBoJofWVaxfhaejEaybbjZkCW.j[RjW=M|ofofaej[WBazj=WBoJjZWCR*WBs:oKR.jst7bIfkofayoMay',
          pictureAligment: const Alignment(-0.2, 0.0),
          job: JobAtCompany(
            title: 'Senior Consultant',
            companyName: 'CGI',
            companyLogo: Uri.parse(''),
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
        11: Participant(
          firstName: 'Simon',
          lastName: 'Graff',
          shortBio:
              'Professional nerd since 2014. Passionate Extended Realities specialist, active as consultant, speaker, podcaster. Also, I co-founded a XR association named nextReality.Hamburg.',
          pictureUrl: Uri.parse('assets/assets/images/people/simon_graff.jpeg'),
          pictureHash:
              '|AD,498x7oV~4:D%9[xo=y??w|0f.8MKWA^*s9-pw|5Q^QW-E1-po#NKW?13WZw[\$fTD-prt9abc58Nw=y-oROIoxbIVI:-:Mxn+%MEMIoxvslngob%1D%kXx]I=xZxFIUVsR%%MIot8jbR%xGaxWTohS1jZjExuIVbHxu',
          job: JobAtCompany(
            title: 'XR Professional & Consultant',
            companyName: 'Simon Graff',
            companyLogo: Uri.parse(''),
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
        12: Participant(
          firstName: 'Stefan',
          lastName: 'Richter',
          shortBio:
              'Stefan Richter, born 1966, is a computer scientist and software engineer. He has been enthusiastic about computer programming and AI since 1983. After various activities in scientific software development, in meteorology and oceanography at the AWI (Alfred Wegener Institute, Helmholtz Centre for Polar and Marine Research) and in applied aerospace research at the ATB (Institute for Applied Systems Technology Bremen), he has now been working in software development over 30 years. In 1999, he co-founded freiheit.com technologies in the midst of the first Internet boom. freiheit.com technologies builds large-scale software platforms for the digital future and helps its international clients to transform their business models into the digital world.',
          pictureUrl: Uri.parse('assets/assets/images/people/stefan_richter.jpg'),
          pictureHash:
              '|aIYIUR*ysoes9jso~s:xu?ws.ELWVQ-a}Rjayaew]WXMxj?R*aet7ofbH4.oKs-WC%Mj]ofWVV@xuWCe.oeWVoLWBjsWBNxoen~WVaea}kCWBj?s:WWV@jsbIf6ofofWBM|j@s:fQogfkaeayaekCaye.j[bIj[e.j[ay',
          job: JobAtCompany(
            title: 'Founder',
            companyName: 'freiheit.com',
            companyLogo: Uri.parse(''),
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
        13: Participant(
          firstName: 'Tam',
          lastName: 'Hanna',
          pictureUrl: Uri.parse('assets/assets/images/people/tam_hanna.jpg'),
          pictureHash:
              '|EE.w\$_4~qDj~VI=oyaJM{9vkYEl^+aiI;R*xaoINZM|WB%1\$%%2RjxtWBo|W=M|Ipt7ogofRks:ngw[\$%xtbHR*RkofbIIpR,WENcI:Rjt6R*WVx]%2\$%M|WBxFxZNGa}ENIqt7NGR*\$*jFWVaxM{%0xYxaR*t6j]R*j[',
          pictureAligment: const Alignment(-0.05, 0.0),
          job: JobAtCompany(
            title: 'Founder',
            companyName: 'Tamoggemon Software and Computer Software Consultant',
            companyLogo: Uri.parse(''),
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
        14: Participant(
          firstName: 'Tereza',
          lastName: 'Iofciu',
          pictureUrl: Uri.parse('assets/assets/images/people/tereza_iofciu.jpg'),
          pictureHash:
              '|iHoLRMx%%jZxut7M{NGoL?cWVkro#aJofWBoJofbwt7n3oJM{RiozWUbbbwS2j[axS4aet7ofn\$t7oJn\$j]WBWXkCozR*X9bIWBjYbIWBs:oLWBs;aye.ayj]bIkCofWBkDjsjZjZbHj@aefkj@f,bHaeayofa#ayf6j[',
          pictureAligment: const Alignment(-0.4, 0.0),
          job: JobAtCompany(
            title: 'Head Data Science Coach',
            companyName: 'neuefische',
            companyLogo: Uri.parse(''),
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
        15: Participant(
          firstName: 'Vladyslav',
          lastName: 'Cherednychenko',
          shortBio: 'Just a person who\'s really into security, technology and outdoor activities',
          pictureUrl: Uri.parse('assets/assets/images/people/vladyslav_cherednychenko.jpg'),
          pictureHash:
              '|kK-LK-p.RRjnObbkCoeof~WR*I;n%RPt7W;ofofRjWBjZofbHaxjZWBWVNat7xZWBW;WBoLj[j@kWayn\$WCWVs:j[ayWBxtayWBofWVj[ofWBayoMWVays:ayWBofa|ayj[j[jsaybHf6oLj[WBkCfke.ayj[oeayWVay',
          job: JobAtCompany(
            title: 'Lead Security Engineer',
            companyName: 'About You',
            companyLogo: Uri.parse(''),
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
        16: Participant(
          firstName: 'Neal',
          lastName: 'Brooks',
          pictureUrl: Uri.parse('assets/assets/images/people/neal_brooks.jpg'),
          job: JobAtCompany(
            title: 'Software Engineer',
            companyName: 'Lendable',
            companyLogo: Uri.parse('assets/assets/images/people/vladyslav_cherednychenko.jpg'),
            homepage: Uri.parse('https://www.lendable.co.uk'),
            description: 'Bringing consumer finance into the digital world',
          ),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/nealio82'),
              platform: Platform.linkedIn,
            ),
            PlatformProfile(
              profileUrl: Uri.parse('https://twitter.com/nealio82'),
              platform: Platform.twitter,
            ),
          ],
          pictureHash:
              '|kK-LK-p.RRjnObbkCoeof~WR*I;n%RPt7W;ofofRjWBjZofbHaxjZWBWVNat7xZWBW;WBoLj[j@kWayn\$WCWVs:j[ayWBxtayWBofWVj[ofWBayoMWVays:ayWBofa|ayj[j[jsaybHf6oLj[WBkCfke.ayj[oeayWVay',
        ),
        17: Participant(
          firstName: 'Martina',
          lastName: 'Ivanova',
          shortBio:
              'The Ivanova sisters are a part of the Sono Digital Group at Sono Motors. Martina is a passionate mobile app UI Designer with a strong affinity to the development of design systems, while Bozhana is a senior UX Designer, who is fascilitating the design competence cluster at Sono. You can often see them putting their skills and knowledge into wireframes, that naturally evolve to prototypes for user testing, and after a refinement reaching the state of User Centered Designs.',
          pictureUrl: Uri.parse('assets/assets/images/people/martina_ivanova.jpg'),
          job: JobAtCompany(
            title: 'UI designer',
            companyName: 'Sono Motors',
            companyLogo: Uri.parse('assets/assets/images/people/vladyslav_cherednychenko.jpg'),
            homepage: Uri.parse('https://sonomotors.com'),
            description: 'The first Solar Electric Vehicle. A car charging itself.',
          ),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/martina-ivanova-931670a8/'),
              platform: Platform.linkedIn,
            ),
            PlatformProfile(
              profileUrl: Uri.parse('https://www.instagram.com/like.a.mo/'),
              platform: Platform.instagram,
            ),
          ],
          pictureHash:
              '|kK-LK-p.RRjnObbkCoeof~WR*I;n%RPt7W;ofofRjWBjZofbHaxjZWBWVNat7xZWBW;WBoLj[j@kWayn\$WCWVs:j[ayWBxtayWBofWVj[ofWBayoMWVays:ayWBofa|ayj[j[jsaybHf6oLj[WBkCfke.ayj[oeayWVay',
        ),
        18: Participant(
          firstName: 'Bozhana',
          lastName: 'Ivanova',
          shortBio:
              'The Ivanova sisters are a part of the Sono Digital Group at Sono Motors. Martina is a passionate mobile app UI Designer with a strong affinity to the development of design systems, while Bozhana is a senior UX Designer, who is fascilitating the design competence cluster at Sono. You can often see them putting their skills and knowledge into wireframes, that naturally evolve to prototypes for user testing, and after a refinement reaching the state of User Centered Designs.',
          pictureUrl: Uri.parse('assets/assets/images/people/bozhana_ivanova.jpg'),
          job: JobAtCompany(
            title: 'Senior UX designer',
            companyName: 'Sono Motors',
            companyLogo: Uri.parse('assets/assets/images/people/vladyslav_cherednychenko.jpg'),
            homepage: Uri.parse('https://sonomotors.com'),
            description: 'The first Solar Electric Vehicle. A car charging itself.',
          ),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/bozhana-ivanova-ba066874/'),
              platform: Platform.linkedIn,
            ),
            PlatformProfile(
              profileUrl: Uri.parse('https://www.instagram.com/like.a.bo/'),
              platform: Platform.instagram,
            ),
          ],
          pictureHash:
              '|kK-LK-p.RRjnObbkCoeof~WR*I;n%RPt7W;ofofRjWBjZofbHaxjZWBWVNat7xZWBW;WBoLj[j@kWayn\$WCWVs:j[ayWBxtayWBofWVj[ofWBayoMWVays:ayWBofa|ayj[j[jsaybHf6oLj[WBkCfke.ayj[oeayWVay',
        ),
        19: Participant(
          firstName: 'Maximilian',
          lastName: 'Berghoff',
          pictureUrl: Uri.parse('assets/assets/images/people/maximilian_berghoff.jpg'),
          pictureAligment: const Alignment(0.15, 0.0),
          job: JobAtCompany(
            title: 'Senior Software Engineer',
            companyName: 'Sono Motors',
            companyLogo: Uri.parse('assets/assets/images/people/vladyslav_cherednychenko.jpg'),
            homepage: Uri.parse('https://sonomotors.com'),
            description: 'The first Solar Electric Vehicle. A car charging itself.',
          ),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/maximilian-berghoff-99b072161/'),
              platform: Platform.linkedIn,
            ),
          ],
          pictureHash:
              '|kK-LK-p.RRjnObbkCoeof~WR*I;n%RPt7W;ofofRjWBjZofbHaxjZWBWVNat7xZWBW;WBoLj[j@kWayn\$WCWVs:j[ayWBxtayWBofWVj[ofWBayoMWVays:ayWBofa|ayj[j[jsaybHf6oLj[WBkCfke.ayj[oeayWVay',
        ),
        20: Participant(
          firstName: 'Elijah',
          lastName: 'Oyekunle',
          shortBio:
              'Elijah Oyekunle is a Technical Lead at replex.io, a SaaS platform for Kubernetes cost management. He also maintains and contributes to several open-source projects, including Kubernetes.',
          pictureUrl: Uri.parse('assets/assets/images/people/elijah_oyekunle.jpg'),
          pictureAligment: const Alignment(-0.7, 0.0),
          job: JobAtCompany(
            title: 'Technical Lead',
            companyName: 'replex',
            companyLogo: Uri.parse('assets/assets/images/people/vladyslav_cherednychenko.jpg'),
            homepage: Uri.parse('https://www.replex.io/'),
            description: 'Kubernetes Governance and Cost Management for the Cloud-Native Enterprise',
          ),
          profiles: [
            PlatformProfile(
              profileUrl: Uri.parse('https://www.linkedin.com/in/maximilian-berghoff-99b072161/'),
              platform: Platform.linkedIn,
            ),
          ],
          pictureHash:
              '|kK-LK-p.RRjnObbkCoeof~WR*I;n%RPt7W;ofofRjWBjZofbHaxjZWBWVNat7xZWBW;WBoLj[j@kWayn\$WCWVs:j[ayWBxtayWBofWVj[ofWBayoMWVays:ayWBofa|ayj[j[jsaybHf6oLj[WBkCfke.ayj[oeayWVay',
        ),
      };
}
