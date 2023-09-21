import 'package:ai_int_app/api.dart';
import 'package:flutter/material.dart';
import 'package:ai_int_app/opbrhome.dart';
import 'package:google_generative_language_api/google_generative_language_api.dart';

void main() async {
  final Model model = await GenerativeLanguageAPI.getModel(
      modelName: "models/chat-bison-001", apiKey: Constants.apiKeyPalm);
  debugPrint('Model Name: ${model.name}');
  debugPrint('Description: ${model.description}');
  runApp(const OpticBrain());
}

//make a OpticBrain state with a bottom navigation bar
class OpticBrain extends StatelessWidget {
  const OpticBrain({Key? key}) : super(key: key);

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
      home: const OpticBrainHome(),
    );
  }
}
