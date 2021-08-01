import 'dart:convert';

import 'package:corona_cases_app/models/country_model.dart';
import 'package:corona_cases_app/models/global_model.dart';
import 'package:http/http.dart' as http;

class CovidService {
  static Future<Globaldata> getGlobaldata() async {
    http.Response res =
        await http.get(Uri.parse('https://api.covid19api.com/summary'));
    print(res.body);
    if (res.statusCode == 200) {
      return Globaldata.fromJson(jsonDecode(res.body));
    }
  }

  static Future getContrydata() async {
    http.Response res =
        await http.get(Uri.parse('https://api.covid19api.com/summary'));
    print(res.body);
    if (res.statusCode == 200) {
      List data = jsonDecode(res.body)['Countries'];
      return data.map((e) => ContryData.fromJson(e)).toList();
    }
  }
}
