import 'package:codehub/models/BootcampsModel/bootcamp_ui_model.dart';
import 'package:codehub/Contants/app_style.dart';
import 'package:codehub/models/HackathonModel/hackathon_ui.dart';
import 'package:http/http.dart' as http;

import '../bloc/hackathons_bloc.dart';

var client = http.Client();

class HackathonsRepo {
  static Future<List<Hacakthon>> fetchHackathon() async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': appinfo.servertoken
      };
      var response = await http.get(
        Uri.parse("https://apicodehub.vercel.app/api/hackathons/getallhackathons"),
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        List<Hacakthon> bootcampsdata =
            hacakthonFromJson(response.body);
        return bootcampsdata;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
