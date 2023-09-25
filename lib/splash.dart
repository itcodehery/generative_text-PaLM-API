import 'package:flutter/material.dart';
import 'package:opticbrain_ai/instructions_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Future<void> checkAPI(String apikey) async {
    if (apikey == 'AIzaSyAnLQ7H-bWqb695EAuJzVS7c30bhj53LRU') {
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString('apikey', apikey);
      });
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.cyan.shade800,
          content: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.white),
              SizedBox(width: 6),
              Text(
                'Oops, invalid API Key!',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SFProDisplay',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          duration: const Duration(seconds: 6),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/OpticBrainWhite.png',
                  width: 60,
                  height: 60,
                ),
                const Text('Welcome to OpticBrain AI',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ProductSanPro')),
                const SizedBox(height: 12),
                Text(
                  'Powered by PaLM API and Google MakerSuite',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.cyan.shade200,
                      fontFamily: 'SFProDisplay'),
                ),
                const SizedBox(height: 120),
                TextField(
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'SFProDisplay'),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                    labelText: 'Enter your API Key here',
                    labelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'ProductSanPro',
                        color: Colors.white70),
                    filled: true,
                    fillColor: Colors.grey.shade900,
                  ),
                  onSubmitted: (value) {
                    checkAPI(value);
                  },
                ),
                const SizedBox(height: 10),
                const InstructionsWidget(),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
