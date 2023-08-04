import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DynamoDbHelper {
  //Rest api gateway
  final footImages = "";
  final footImprints = "";
  final gaitVideos = "";
  final userInfo = "";
  final physicalInfo = "";
  final userReport = "";
  final latestUuid = "";

  Future<void> postFootImages(
      {required String key, required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString("userId") ?? "";
    // String profileName = prefs.getString("currentProfileName") ?? "";
    // Response response = await post(
    //   footImages,
    //   headers: {
    //     "primarykeyname": "userId",
    //     "primarykeyvalue": userId,
    //     // "sortkeyname": "profileName",
    //     // "sortkeyvalue": profileName,
    //     "parameter": key,
    //     "value": value
    //   },
    // );
    // print(response.body);
  }

  // Future<List<dynamic>> getFootImages({required String key}) async {
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // String userId = prefs.getString("userId") ?? "";
  // String profileName = prefs.getString("currentProfileName") ?? "";
  // Response response = await get(
  //   footImages,
  //   headers: {
  //     "primarykeyname": "userId",
  //     "primarykeyvalue": userId,
  //     // "sortkeyname": "profileName",
  //     // "sortkeyvalue": profileName,
  //     "parameter": key,
  //   },
  // );

  // return json.decode(json.decode(response.body)['S'].toString());
  // }
}
