class Prompts {
  static Map summaryPrompts = {
    "extractive":
        "Extract the most important sentences from the following text without rephrasing:\n\nfor example Text: \"Artificial intelligence is one of the most important modern technologies affecting various aspects of life...\"\n\nExpected output:\n\"Artificial intelligence is one of the most important modern technologies. It is used in big data analysis, improving medical services, and developing autonomous driving systems...\"",
    "abstractive":
        "Rephrase the following text in a new style while preserving the core meaning:\n\nfor example Text: \"Artificial intelligence is one of the most important modern technologies affecting various aspects of life...\"\n\nExpected output:\n\"Artificial intelligence is an advanced technology used in multiple fields such as healthcare, commerce, and data analysis, enhancing service efficiency...\"",
    "thematic":
        "Summarize the following text focusing only on economic-related information:\n\nfor example Text: \"Artificial intelligence is one of the most important modern technologies affecting various aspects of life...\"\n\nExpected output:\n\"AI is used in e-commerce to enhance user experience through smart recommendations. However, it may lead to job losses, affecting the labor market.\"",
    "paragraph":
        "Summarize each paragraph of the following text separately:\n\n for example Text: \"Artificial intelligence is one of the most important modern technologies affecting various aspects of life...\"\n\nExpected output:\n- **Paragraph 1:** AI is a modern technology impacting various fields.\n- **Paragraph 2:** It is used in data analysis, healthcare, autonomous driving, and e-commerce.\n- **Paragraph 3:** It raises concerns about privacy and the job market.",
    "word_limit":
        "Summarize the following text to about for example '50%' of its original length:\n\n for example Text: \"Artificial intelligence is one of the most important modern technologies affecting various aspects of life...\"\n\nExpected output:\n\"AI is a modern technology used in data analysis, healthcare, and commerce. Despite its benefits, it raises concerns about privacy and employment.\"",
    "bullet_points":
        "Convert the following text into a concise bullet-point summary highlighting key ideas:\n\nfor example Text: \"Artificial intelligence is one of the most important modern technologies affecting various aspects of life...\"\n\nExpected output:\n✅ Used in data analysis, healthcare, autonomous driving, and e-commerce.\n✅ Enhances user experience through smart recommendations.\n✅ Raises concerns about privacy and security.\n✅ May impact traditional jobs in the labor market.",
    "qa":
        "Convert the following text into a set of extracted questions and answers:\n\nfor example Text: \"Artificial intelligence is one of the most important modern technologies affecting various aspects of life...\"\n\nExpected output:\n❓ **What are the benefits of AI?**\n✅ It is used in data analysis, healthcare, and autonomous driving.\n\n❓ **How is AI used in e-commerce?**\n✅ It improves user experience through smart recommendations.\n\n❓ **What are the concerns regarding AI?**\n✅ Privacy, security, and its impact on traditional jobs."
  };

  static const String summaryPromptRole =
      " provide only the  content without any introductions or explanations:\n\n{text}";

  static const String summaryIntro = "You are a specialized AI model for text summarization, following prede";
}
