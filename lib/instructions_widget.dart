import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InstructionsWidget extends StatelessWidget {
  const InstructionsWidget({
    super.key,
  });

  Future<void> launchContactURL() async {
    Uri url = Uri.parse(
        'https://linktr.ee/itwritshery'); // Replace with your desired URL

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchGoogleURL() async {
    Uri url = Uri.parse('https://makersuite.google.com/app/home');

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    } // Replace with your desired URL,
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.cyan.shade900.withAlpha(100),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
            padding: const EdgeInsets.all(12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: Colors.white,
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Help:',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ProductSanPro',
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.cyan.shade800,
              ),
              const Text(
                'You need an Google MakerSuite Chat API key to operate this app. You can find instructions on how to get your API key on the link below, or you can contact me on mail to get an API key from me.',
                style: TextStyle(
                  color: Colors.white70,
                  fontFamily: 'SFProDisplay',
                ),
              ),
              const SizedBox(height: 10),
              Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.cyan.shade800),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                    ),
                    onPressed: () {
                      launchContactURL();
                    },
                    child: const Text(
                      'Contact Me',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'ProductSanPro',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      launchGoogleURL();
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.cyan.shade200),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                    ),
                    child: Text(
                      'Get MakerSuite Key',
                      style: TextStyle(
                        color: Colors.cyan.shade900,
                        fontFamily: 'ProductSanPro',
                      ),
                    ),
                  ),
                ],
              )
            ])));
  }
}
