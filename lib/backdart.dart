import 'package:ai_int_app/api.dart';
import 'package:google_generative_language_api/google_generative_language_api.dart';

//check if this code would work
class PalmAI {
  //for text based models
  Future<String> getText(String prompt) async {
    var request = GenerateTextRequest(
      prompt: TextPrompt(text: prompt),
      temperature: 1.0,
      candidateCount: 2,
    );

    final GeneratedText text = await GenerativeLanguageAPI.generateText(
      modelName: 'models/text-bison-001',
      request: request,
      apiKey: Constants.apiKeyPalm,
    );

    print(text.candidates.map((candidate) => candidate.output).join('\n'));
    String output =
        text.candidates.map((candidate) => candidate.output).join('\n');

    return output;
  }

  //for message based models
  Future<String> getMessage(String prompt) async {
    var request = GenerateMessageRequest(
      prompt: MessagePrompt(
        messages: [
          Message(author: '1', content: prompt),
        ],
      ),
    );

    final GeneratedMessage generatedMessage =
        await GenerativeLanguageAPI.generateMessage(
      modelName: 'models/chat-bison-001',
      request: request,
      apiKey: Constants.apiKeyPalm,
    );

    String message = generatedMessage.messages.map((e) => e.content).join('\n');
    return message;
  }

  //to get the details of the model
  void getModelDetails() async {}

  //to get the token count of the model
  Future<int> getTokenCount() async {
    MessagePrompt prompt =
        MessagePrompt(messages: List.unmodifiable(<String>['get token count']));
    final int tokenCount = await GenerativeLanguageAPI.countMessageTokens(
      modelName: 'models/chat-bison-001',
      request: CountMessageTokensRequest(prompt: prompt),
      apiKey: Constants.apiKeyPalm,
    );

    print('Token Count: $tokenCount');
    return tokenCount;
  }
}
