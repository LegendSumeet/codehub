import 'package:codehub/models/BootcampsModel/bootcamp_ui_model.dart';
import 'package:codehub/Contants/app_style.dart';
import 'package:codehub/models/BootcampsModel/bootcamp_ui_modelbyid.dart';
import 'package:http/http.dart' as http;
import '../../../../models/conferences/conferece_ui_modelbyid.dart';
import '../bloc/conferencesbyid_bloc.dart';

var client = http.Client();

class ConferenceByIdRepos {
  static Future<ConferenceBYid> fetchConferencesbyid(String id) async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': appinfo.servertoken
      };
      var response = await http.get(
        Uri.parse(
            "https://apicodehub.vercel.app/api/conferences/getconferences/$id"),
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        ConferenceBYid conferenceBYid = conferenceBYidFromJson(response.body);
        return conferenceBYid;
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
