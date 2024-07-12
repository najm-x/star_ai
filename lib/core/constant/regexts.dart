class Appregex {
  static RegExp emailRegex = RegExp(r'([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+)');
  static RegExp numberRegex = RegExp(r'\+?\d{2,4}[\s-]?\d{0,6}[\s-]?\d{2,4}[\s-]?\d{2,4}[\s-]?\d{0,4}');
}