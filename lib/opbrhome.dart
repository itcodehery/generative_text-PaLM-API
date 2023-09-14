import 'package:flutter/material.dart';
import 'package:google_generative_language_api/google_generative_language_api.dart';

class OpticBrainHome extends StatefulWidget {
  const OpticBrainHome({Key? key}) : super(key: key);

  @override
  OpticBrainHomeState createState() => OpticBrainHomeState();
}

class OpticBrainHomeState extends State<OpticBrainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Optic Brain'),
      ),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(),
          Text('Enter your query:'),
        ],
      )),
    );
  }
}
