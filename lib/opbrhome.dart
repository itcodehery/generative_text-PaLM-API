import 'package:ai_int_app/backdart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ai_int_app/tokendisc.dart';

class OpticBrainHome extends StatefulWidget {
  const OpticBrainHome({Key? key}) : super(key: key);

  @override
  OpticBrainHomeState createState() => OpticBrainHomeState();
}

class OpticBrainHomeState extends State<OpticBrainHome> {
  String promptResponse = '';
  String? initialResponse;
  String? finalResponse;
  String byAIname = '';
  int tokensLeft = 0;

  @override
  void initState() {
    super.initState();
    PalmAI palm = PalmAI();
    palm.getTokenCount().then((value) {
      setState(() {
        tokensLeft = value;
      });
    });
  }

  String capitalize(String input) {
    var words = input.split(' ');
    for (var i = 0; i < words.length; i++) {
      words[i] = words[i][0].toUpperCase() + words[i].substring(1);
    }
    return words.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Powered by PaLM API and Google MakerSuite',
          style: TextStyle(color: Colors.white38, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // TextButton.icon(
                  //     style: ButtonStyle(
                  //         shape: MaterialStateProperty.all(
                  //             RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(40))),
                  //         minimumSize:
                  //             MaterialStateProperty.all(const Size(40, 40)),
                  //         backgroundColor:
                  //             MaterialStateProperty.all(Colors.grey.shade900)),
                  //     label: const Text(
                  //       'Clear queries',
                  //       style: TextStyle(
                  //           fontFamily: 'ProductSanPro', color: Colors.white60),
                  //     ),
                  //     onPressed: () {
                  //       setState(() {
                  //         promptResponse = '';
                  //         finalResponse = null;
                  //         byAIname = '';
                  //       });
                  //     },
                  //     icon: const Icon(Icons.restore)),
                  const SizedBox(height: 8),
                  TokenDisc(tokensLeft: tokensLeft),
                  Card(
                    child: SizedBox(
                      height: finalResponse == null ? 0 : 400,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                byAIname,
                                style: TextStyle(
                                  fontFamily: 'ProductSanPro',
                                  color: Colors.cyan.shade200,
                                  fontSize: 14,
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 110,
                                    child: Text(
                                      finalResponse == null
                                          ? ''
                                          : capitalize(finalResponse!),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'ProductSanPro'),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                      onPressed: () async {
                                        if (initialResponse != null) {
                                          await Clipboard.getData(
                                              promptResponse);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(
                                                      'Response copied to clipboard!')));
                                        }
                                      },
                                      tooltip: 'Copy response',
                                      icon: Icon(
                                        Icons.content_copy_rounded,
                                        size: 22,
                                        color: finalResponse == null
                                            ? Colors.transparent
                                            : Colors.grey.shade700,
                                      ))
                                ],
                              ),
                              Divider(
                                color: finalResponse == null
                                    ? Colors.transparent
                                    : Colors.cyan.shade900,
                                thickness: 1,
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: promptResponse,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        height: 1.5,
                                        fontFamily: 'SFProDisplay',
                                      ))),
                              // formatString(promptResponse),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)),
                                labelText: 'Ask anything',
                                labelStyle: const TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.grey.shade900),
                            onChanged: (value) async {
                              finalResponse = value;
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
                                minimumSize: MaterialStateProperty.all(
                                    const Size(60, 60)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.grey.shade900)),
                            onPressed: () {
                              setState(() {
                                promptResponse = '';
                                finalResponse = null;
                                byAIname = '';
                              });
                            },
                            icon: const Icon(
                              Icons.restore,
                              color: Colors.white60,
                            )),
                        const SizedBox(width: 10),
                        IconButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(60, 60)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.cyan.shade200)),
                            onPressed: () {
                              PalmAI palm = PalmAI();
                              palm.getText(finalResponse!).then((value) {
                                setState(() {
                                  promptResponse = value;
                                  byAIname =
                                      'Google PaLM • ${TimeOfDay.now().format(context)}';
                                  palm.getTokenCount().then((value) {
                                    tokensLeft = value;
                                  });
                                });
                              });
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.black87,
                            )),
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
