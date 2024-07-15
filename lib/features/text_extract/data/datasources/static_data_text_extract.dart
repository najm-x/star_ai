class StaticDataTextExtract {
  static const String prompt = """
Task:
Your task is to extract all text present within an image, regardless of the language used.
Input:
You will be provided with an image containing text in various languages.
Output:
The output should be accurate text that matches the text in the image.
Technical Requirements:
You must utilize advanced Optical Character Recognition (OCR) techniques to ensure accurate text extraction.
Your model should support multiple languages, including those with complex characters like Chinese and Arabic.
Accuracy Standards:
The text extraction accuracy rate must be higher than 95%.
You must avoid common errors such as misidentified characters or words.
Formatting:
Text should be extracted in the same order as it appears in the image.
If special formatting exists (e.g., lists or tables), you must preserve this formatting as much as possible in the output text.
Handling Special Cases:
If the text is unclear or distorted, clearly indicate this in the output.
If multi-line text or slanted text is present, you must accurately recognize and reflect it correctly in the output text.
Examples:
Image Example 1: An image containing English text: "Hello, how are you at the Abdel Nasser Foundation for Software Technologies"
Extracted Text: "Hello, how are you at the Abdel Nasser Foundation for Software Technologies"
Image Example 2: An image containing Chinese text: "你好，世界！"
Extracted Text: "你好，世界！"
Important Final Note: The text must be extracted from the image word by word to ensure no part of the text is missing in the output.
""" ;
}