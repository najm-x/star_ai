import 'package:business_tools/core/constant/api_key.dart';
import 'package:business_tools/core/constant/shared_key.dart';
import 'package:business_tools/core/services/app_services.dart' show sl;
import 'package:shared_preferences/shared_preferences.dart';

Future<String> handelApiKey() async {
  String key = sl<SharedPreferences>().getString(SharedKey.addApiKey) ?? apiKey ;
  print(key) ; 
  return  key;
}
