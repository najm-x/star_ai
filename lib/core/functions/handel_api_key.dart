import 'package:business_tools/core/constant/shared_key.dart';
import 'package:business_tools/core/services/app_services.dart' show sl;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:business_tools/core/constant/api_keys.dart' ;
Future<String> handelApiKey() async {
  String key = sl<SharedPreferences>().getString(SharedKey.addApiKey) ?? geminiKey.replaceFirst(r'QSc', '') ;
  return  key;
}
