import 'package:opticbrain_ai/splash.dart';
import 'package:flutter/material.dart';
import 'package:opticbrain_ai/opbrhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(const OpticBrain());
}

//make a OpticBrain state with a bottom navigation bar
class OpticBrain extends StatefulWidget {
  const OpticBrain({Key? key}) : super(key: key);

  @override
  State<OpticBrain> createState() => _OpticBrainState();
}

class _OpticBrainState extends State<OpticBrain> {
  Future<void> getAPIDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? apikey = prefs.getString('apikey');
    if (apikey == null) {
      debugPrint('No API Key found!');
    } else {
      apiKey = prefs.getString('apikey');
    }
  }

  @override
  void initState() {
    super.initState();
    getAPIDetails();
  }

  String? apiKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Optic Brain',
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'SFProDisplay',
          canvasColor: Colors.black87,
          colorScheme: ColorScheme(
              brightness: Brightness.light,
              primary: Colors.grey[700]!,
              onPrimary: Colors.white,
              secondary: Colors.grey.shade600,
              onSecondary: Colors.white,
              error: Colors.redAccent,
              onError: Colors.white,
              background: Colors.black87,
              onBackground: Colors.white,
              surface: Colors.grey.shade900,
              onSurface: Colors.white)),
      routes: {
        '/home': (context) => const OpticBrainHome(),
        '/splash': (context) => const Splash(),
      },
      home: apiKey == null ? const Splash() : const OpticBrainHome(),
    );
  }
}
