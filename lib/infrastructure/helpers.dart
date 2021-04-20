import 'package:url_launcher/url_launcher.dart';

Future<void> openURL(String urlString) async {
  if (await canLaunch(urlString)) {
    await launch(urlString);
  }
}
