import 'package:codehub/models/BootcampsModel/bootcamp_ui_model.dart';
import 'package:codehub/Contants/app_style.dart';
import 'package:codehub/models/BootcampsModel/bootcamp_ui_modelbyid.dart';
import 'package:http/http.dart' as http;
import '../../../../models/TechEventsModel/TechEventbyid_ui.dart';
import '../bloc/TechEventsbyid_bloc.dart';

var client = http.Client();

class GetTechEventsByIdRepo {
  static Future<TechEventsByid> fetchTecheventsbyid(String id) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': appinfo.servertoken
      };
      var response = await http.get(
        Uri.parse(
            "https://apicodehub.vercel.app/api/events/getevent/$id"),
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        TechEventsByid bootcampsdata = techEventsByidFromJson(response.body);
        return bootcampsdata;
      } else {
        print(
            "Error: Failed to fetch bootcamps. Status code: ${response.statusCode}");
        throw Exception(
            "Failed to fetch bootcamps. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: Failed to fetch bootcamps. Exception: $e");
      throw Exception("Failed to fetch bootcamps. Exception: $e");
    }
  }
}
