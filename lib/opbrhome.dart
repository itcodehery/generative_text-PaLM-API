import 'package:ai_int_app/backdart.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_language_api/google_generative_language_api.dart';

class OpticBrainHome extends StatefulWidget {
  const OpticBrainHome({Key? key}) : super(key: key);

  @override
  OpticBrainHomeState createState() => OpticBrainHomeState();
}

class OpticBrainHomeState extends State<OpticBrainHome> {
  String promptResponse = 'Ask anything';
  String? initialResponse;
  String byAIname = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.cyan.shade700,
          title: const Text(
            'Optic Brain',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: SizedBox(
              height: 30,
              child: Text(
                'Powered by PaLM API and Google MakerSuite',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    child: SizedBox(
                      height: 600,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  byAIname,
                                  style: TextStyle(
                                    fontFamily: 'ProductSans',
                                    color: Colors.cyan.shade700,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(promptResponse),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                labelText: 'Ask anything',
                                labelStyle: const TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.grey.shade900),
                            onSubmitted: (value) async {
                              //call the api here
                              initialResponse = value;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.cyan.shade700)),
                            onPressed: () {
                              PalmAI palm = PalmAI();
                              palm.getText(initialResponse!).then((value) {
                                setState(() {
                                  promptResponse = value;
                                  byAIname = 'Google PaLM';
                                });
                              });
                            },
                            icon: const Icon(Icons.send)),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
