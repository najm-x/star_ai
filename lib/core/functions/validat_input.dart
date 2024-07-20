import 'package:business_tools/core/constant/types_validate.dart';

validateInput(String val, String type, int max, int less) {
  if (type == TypesValidate.videoId) {
    if (val.isEmpty || !val.contains('https')) {
      return "Video url must have https";
    }
  }
  if (type == TypesValidate.videoInfo) {
    if (val.isEmpty || val.length < less || val.length > max) {
      return "not Empty And not less than $less or max $max";
    }
  }
}
