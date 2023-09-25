import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  Future<void> launchGithubURL() async {
    Uri url = Uri.parse(
        'https://github.com/itcodehery'); // Replace with your desired URL

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> launchLinkTreeURL() async {
    Uri url = Uri.parse(
        'https://linktr.ee/itwritshery'); // Replace with your desired URL

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.cyan.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text('OpticBrain AI',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: 'ProductSanPro',
                            letterSpacing: -1,
                            fontWeight: FontWeight.bold)),
                    Text('A Google Powered Chatbot',
                        style: TextStyle(fontSize: 20)),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Made by '),
                    Text(
                      'Hari Prasad',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text('from Christ Academy Institute for Advanced Studies'),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Flex(
                    direction: Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Contact Me:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                              onPressed: launchGithubURL,
                              style: const ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)))),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.blueGrey)),
                              // icon: const Icon(
                              //   Icons.verified_sharp,
                              //   color: Colors.white,
                              // ),
                              icon: Image.asset(
                                'assets/github-mark-white.png',
                                fit: BoxFit.contain,
                                height: 20,
                                width: 20,
                              ),
                              label: const Text(
                                'My Github',
                                style: TextStyle(color: Colors.white),
                              )),
                          const SizedBox(width: 20),
                          ElevatedButton.icon(
                              onPressed: launchLinkTreeURL,
                              style: const ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)))),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color.fromARGB(255, 42, 165, 77))),
                              icon: const Icon(
                                Icons.link,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'My Linktree',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ]),
              ),
            ),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Text(
                        'OpticBrain AI is a API testing mobile chat app, supercharged with Google\'s smart PaLM Language Model and the Google MakerSuite. It\'s a query based AI model in your pocket. Whether you need help, info, or just any question, OpticBrain AI gets you. Plus, it learns from you, so every chat feels like it\'s tailor-made just for you. Say hello to the mini version of ChatGPT!'),
                    SizedBox(height: 20),
                    Text(
                        'This app was made using Google\'s Flutter Cross Platform Frontend Framework with the Dart Programming Language, SharedPreferences to store data, and Google\'s PaLM Model and MakerSuite.'),
                    SizedBox(
                      height: 40,
                    ),
                    Text('2023 Hari Prasad ©',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
