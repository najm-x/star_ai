class VideoId  {
  static final _regMatchExp = RegExp(r'youtube\..+?/watch.*?v=(.*?)(?:&|/|$)');
  static final _shortMatchExp = RegExp(r'youtu\.be/(.*?)(?:\?|&|/|$)');
  static final _embedMatchExp = RegExp(r'youtube\..+?/embed/(.*?)(?:\?|&|/|$)');
  static final _shortsMatchExp =
      RegExp(r'youtube\..+/shorts/([A-Za-z0-9-_]+$)');

  static bool validateVideoId(String videoId) {
    if (videoId.isEmpty || videoId.contains(" ") ) {
      return false;
    }

    if (videoId.length != 11) {
      return false;
    }

    return !RegExp(r'[^0-9a-zA-Z_\-]').hasMatch(videoId);
  }

  /// Parses a video id from url or if given a valid id as url returns itself.
  /// Returns null if the id couldn't be extracted.
  static String? parseVideoId(String url) {
    if (url.isEmpty || url.contains(" ") ) {
      return null;
    }

    if (validateVideoId(url)) {
      return url;
    }

    // https://www.youtube.com/watch?v=yIVRs6YSbOM
    final regMatch = _regMatchExp.firstMatch(url)?.group(1);
    if (regMatch != null && validateVideoId(regMatch)) {
      return regMatch;
    }

    // https://youtu.be/yIVRs6YSbOM
    final shortMatch = _shortMatchExp.firstMatch(url)?.group(1);
    if (shortMatch != null && validateVideoId(shortMatch)) {
      return shortMatch;
    }

    // https://www.youtube.com/embed/yIVRs6YSbOM
    final embedMatch = _embedMatchExp.firstMatch(url)?.group(1);
    if (embedMatch != null && validateVideoId(embedMatch)) {
      return embedMatch;
    }

    // https://www.youtube.com/shorts/yIVRs6YSbOM
    final shortsMatch = _shortsMatchExp.firstMatch(url)?.group(1);
    if (shortsMatch != null && validateVideoId(shortsMatch)) {
      return shortsMatch;
    }
    return null;
  }
}
