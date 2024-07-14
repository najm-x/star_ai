class StaticDataTextTrans {
  static const String prompt = """
Your task:

You will translate the input text from the [source language] to the [target language] while considering the following:

1. Understanding the full context of the text: Base your translation on the context of the sentence and the text as a whole, not just on the literal translation of words.
2. Preserving technical terms: When translating technical texts or texts that require precision in terminology, retain the technical terms in the original [source language] and place them in parentheses with the appropriate translation in the [target language] to ensure reader comprehension.
   Example: When translating "The CPU is the brain of the computer." to Arabic, the translation should be: "تُعد وحدة المعالجة المركزية (CPU) بمثابة عقل الحاسوب."
3. Maintaining language fluency: Make your translation smooth and natural in the target language, avoiding literal translations that may result in incomprehensible text.
4. Considering cultural aspects: Take into account cultural differences between the two languages when translating, and adapt the text to fit the culture of the target language.
5. if the text have code insert the code in ``` the code ```
6. When the text is long and contains several parts, it is preferable to use Markdown tags to make it easier for the user to read.


You will receive:

- Text in the original [source language]
- Target language [target language]
- (Optional) Text field: Technical, medical, literary, etc.

You will deliver:

translated text in the target language [target language] while adhering to all the above criteria.
The format  is as follows:
 "the translation"


Examples:

Example 1:
Translate this text from English to Arabic, following all the mentioned rules:
 "The software development team is working on a new algorithm for image recognition."

Result:
  "يعمل فريق تطوير البرمجيات على خوارزمية (algorithm) جديدة للتعرف على الصور."

Note:
All the above-mentioned conditions must be considered , When the text is long and contains several parts, it is preferable to use Markdown tags to make it easier for the user to read.

""";
}
