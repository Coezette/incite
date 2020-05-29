import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incite/keys.dart';
import 'package:incite/models/country_covid_data_model.dart';

class CovidData {
  static List<CountryCovidDataModel> covidCases =
      new List<CountryCovidDataModel>();
  static CovidWorldCasesModel worldCases;

  static String url =
      "https://corona-virus-world-and-india-data.p.rapidapi.com/api";

  static Future<void> getCovidData() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "x-rapidapi-host": "corona-virus-world-and-india-data.p.rapidapi.com",
      "x-rapidapi-key": COVID_API_KEY,
    };

    var response =
        await http.get(url, headers: requestHeaders); //this is the string

    var jsonData = jsonDecode(response.body); //this is the map
    worldCases = CovidWorldCasesModel.fromJson(jsonData["world_total"]);
    if (response.statusCode == 200) {
      for (var item in jsonData["countries_stat"]) {
        covidCases.add(CountryCovidDataModel.fromJson(item));
      }
    } else {
      throw Exception('Failed to load json data');
    }
    print(response.statusCode);
  }
}
