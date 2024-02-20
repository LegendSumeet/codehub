import 'package:codehub/models/BootcampsModel/bootcamp_ui_model.dart';
import 'package:codehub/Contants/app_style.dart';
import 'package:http/http.dart' as http;

import '../bloc/bootcamps_bloc.dart';

var client = http.Client();

class BootcampsRepo {
  static Future<List<BootcampModel>> fetchBootcamps() async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': appinfo.servertoken
      };
      var response = await http.get(
        Uri.parse("https://apicodehub.vercel.app/api/bootcamps/getallbootcamp"),
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        List<BootcampModel> bootcampsdata =
            bootcampModelFromJson(response.body);
        return bootcampsdata;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
