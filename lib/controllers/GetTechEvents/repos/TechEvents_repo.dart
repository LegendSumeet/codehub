import 'package:codehub/models/BootcampsModel/bootcamp_ui_model.dart';
import 'package:codehub/Contants/app_style.dart';
import 'package:http/http.dart' as http;

import '../../../models/TechEventsModel/TechEventbyid_ui.dart';
import '../../../models/TechEventsModel/techevent_ui.dart';
import '../bloc/TechEvents_bloc.dart';

var client = http.Client();

class TechEventsRepo {
  static Future<List<TechEvents>> fetchTechEvents() async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': appinfo.servertoken
      };
      var response = await http.get(
        Uri.parse("https://apicodehub.vercel.app/api/events/getevent"),
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        List<TechEvents> bootcampsdata = techEventsFromJson(response.body);
        return bootcampsdata;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
