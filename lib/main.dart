import 'package:flutter/material.dart';
import 'package:ai_int_app/opbrhome.dart';

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
