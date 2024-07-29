dateFormat(String time) {
  List<String> timeParts = time.split('.');
  return "${timeParts[0]}";
}
