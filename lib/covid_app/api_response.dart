
import 'dart:convert';

import 'package:sample_project/covid_app/app_urls.dart';

import 'WorldStateModel.dart';
import 'package:http/http.dart' as http;

class ApIServices {

  // all country record method
  Future<WorldStateModel> fetchData () async {
    final response = await http.get(Uri.parse(AppUrl.baseUrlData));
    if(response.statusCode == 200){
       var data = jsonDecode(response.body.toString());
       return WorldStateModel.fromJson(data);
    }else {
      throw Exception("Error");
    }
  }

  // county wise record method
  var data;
  Future<List<dynamic>> fetchCountryWiseData() async {
     final response = await http.get(Uri.parse(AppUrl.countyStateUrl));
     if(response.statusCode == 200){
       data = jsonDecode(response.body.toString());
       return data;
     }else{
       throw Exception("Error");
     }
  }

}