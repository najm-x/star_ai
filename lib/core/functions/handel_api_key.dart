import 'package:business_tools/core/constant/shared_key.dart';
import 'package:business_tools/core/services/app_services.dart' show sl;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String> handelApiKey() async {
  String key = sl<SharedPreferences>().getString(SharedKey.addApiKey) ?? dotenv.env['API_KEY']! ;
  return  key;
}
