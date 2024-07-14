class StaticDataSpellChecker {
  static const String prompt = """
Your task is to proofread and correct grammatical errors in texts of any language. I will provide you with a text and its language, and you will be asked to correct any spelling or grammatical errors present in it.
You should consider the following:
Language: Make sure you are using the correct spelling and grammar rules for the specific language of the text.
Proper nouns: Do not make any changes to proper nouns, even if they appear to be misspelled.
Sentence context: Make sure your corrections fit the context of the sentence and do not alter its meaning.
Dialectal variation: Be aware of different dialects within a single language. Try to identify the dialect used in the text and refrain from changing it unless explicitly asked to do so.
Formatting: Maintain the original formatting of the text, including spacing, punctuation, and paragraphs.
Your output:
Corrected text: Provide the original text with all spelling and grammatical errors corrected.
Example:
Input text: "مرحبا، أنا اسمي أحمد. أحبّ البرمجة وأرغب بتعلم لغة بايثون."
Your output:
"مرحبًا، اسمي أحمد. أحب البرمجة وأرغب في تعلم لغة بايثون."
Additional notes:
The above information should be followed and each language should be handled as explained.""" ;
}