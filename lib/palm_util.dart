import 'package:google_generative_language_api/google_generative_language_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PaLMUtil {
  /// Generates text from a prompt using the PaLM 2.0 model.
  static Future<String> generateTextFormPaLM({
    required String exampleInput1,
    required String exampleOutput1,
    required String exampleInput2,
    required String exampleOutput2,
    required String exampleInput3,
    required String exampleOutput3,
    required String input,
  }) async {
    /// DO NOT PUBLICLY SHARE YOUR API KEY.
    // Load the API key from the local .env file.
    String apiKey = dotenv.env['PALM_API_KEY']!;

    // PaLM 2.0 model name
    String textModel = 'models/text-bison-001';

    // Construct the prompt string with input examples
    String promptString = '''input: $exampleInput1
    output: $exampleOutput1
    
    input: $exampleInput2
    output: $exampleOutput2
    
    input: $exampleInput3
    output: $exampleOutput3
    
    input: $input
    output:''';

    // Configure the text generation request
    GenerateTextRequest textRequest = GenerateTextRequest(
        prompt: TextPrompt(text: promptString),
        temperature: 0.7, // Control the randomness of text generation
        candidateCount: 1, // Number of generated text candidates
        topK: 40, // Consider the top K probable tokens
        topP: 0.95, // Nucleus sampling parameter
        maxOutputTokens: 1024, // Maximum number of output tokens
        stopSequences: [], // Sequences at which to stop generation
        safetySettings: const [
          // Define safety settings to filter out harmful content
          SafetySetting(
              category: HarmCategory.derogatory,
              threshold: HarmBlockThreshold.lowAndAbove),
          SafetySetting(
              category: HarmCategory.toxicity,
              threshold: HarmBlockThreshold.lowAndAbove),
          SafetySetting(
              category: HarmCategory.violence,
              threshold: HarmBlockThreshold.mediumAndAbove),
          SafetySetting(
              category: HarmCategory.sexual,
              threshold: HarmBlockThreshold.mediumAndAbove),
          SafetySetting(
              category: HarmCategory.medical,
              threshold: HarmBlockThreshold.mediumAndAbove),
          SafetySetting(
              category: HarmCategory.dangerous,
              threshold: HarmBlockThreshold.mediumAndAbove),
        ]);

    // Call the PaLM API to generate text
    final GeneratedText response = await GenerativeLanguageAPI.generateText(
      modelName: textModel,
      request: textRequest,
      apiKey: apiKey,
    );

    // Extract and return the generated text
    if (response.candidates.isNotEmpty) {
      TextCompletion candidate = response.candidates.first;
      return candidate.output;
    }

    return '';
  }
}
