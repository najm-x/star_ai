import 'package:google_generative_ai/google_generative_ai.dart';

Future<bool> checkApiKey(String apiKey) async {
  try {
    final GenerativeModel model = GenerativeModel(model: "gemini-1.5-flash-latest", apiKey: apiKey);
    final response = await model.generateContent([Content.text("hello")]);
    return response.text != null;
  } catch (e) {
    return false;
  }
}
