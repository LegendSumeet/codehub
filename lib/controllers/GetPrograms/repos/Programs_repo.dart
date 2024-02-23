import 'package:codehub/models/BootcampsModel/bootcamp_ui_model.dart';
import 'package:codehub/Contants/app_style.dart';
import 'package:http/http.dart' as http;

import '../../../models/openrepomodel/openrepo_ui_model.dart';
import '../bloc/open_source_programs_bloc.dart';

var client = http.Client();

class GetProgramsRepo {
  static Future<List<OpenRepo>> fetchPrograms() async {
    try {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'authorization': appinfo.servertoken
      };
      var response = await http.get(
        Uri.parse("https://apicodehub.vercel.app/api/openrepo/getallrepo"),
        headers: requestHeaders,
      );
      if (response.statusCode == 200) {
        List<OpenRepo> bootcampsdata = openRepoFromJson(response.body);
        return bootcampsdata;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
