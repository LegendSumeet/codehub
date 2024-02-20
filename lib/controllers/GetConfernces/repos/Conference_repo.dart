import 'package:codehub/models/BootcampsModel/bootcamp_ui_model.dart';
import 'package:codehub/Contants/app_style.dart';
import 'package:codehub/models/conferences/conferences_ui_model.dart';
import 'package:http/http.dart' as http;

import '../bloc/Conference_bloc.dart';

var client = http.Client();

class BootcampsRepo {
  static Future<List<Conferences>> fetchConfernece() async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': appinfo.servertoken
      };
      var response = await http.get(
        Uri.parse("https://apicodehub.vercel.app/api/conferences/getallconferences"),
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        List<Conferences> ConferenceData = conferencesFromJson(response.body);
        return ConferenceData;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
