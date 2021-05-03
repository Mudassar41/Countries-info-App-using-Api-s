import 'dart:convert';

import 'package:countries_info/Models/Countries.dart';
import 'package:http/http.dart' as http;

class CountriesApiData {
  Future<List<Countries>> GetAfricaRegionCountries() async {
    var data = await http.get('https://restcountries.eu/rest/v2/region/africa');

    final parsed = jsonDecode(data.body).cast<Map<String, dynamic>>();
    List<Countries> countriesList =
        parsed.map<Countries>((json) => Countries.fromJson(json)).toList();
    return countriesList;
  }

  Future<List<Countries>> GetAllCountriesData(String Code) async {
    print('Country code is $Code');
    print(">>>");
    List<Countries> countriesList = [];
    final http.Response response =
        await http.get('https://restcountries.eu/rest/v2/alpha/$Code');
    // print(response.body);

    Map<String, dynamic> value = jsonDecode(response.body);

    Countries countries = Countries.GetList(
        value['name'],
        value['alpha2Code'],
        value['capital'],
        value['subregion'],
        value['flag'],
        value['borders'],
        value['languages'],
        value['area'],
        value['population'],
        value['gini'],
        value['demonym'],
        value['currencies']);
    countriesList.add(countries);
    print(countriesList.length);
    return countriesList;
  }

 Future<List<Countries>> SearchCountry(String country) async{


   //List<Countries> countriesList = [];
   final http.Response response =
       await http.get('https://restcountries.eu/rest/v2/name/$country?fullText=true');
    print(response.body);

   final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
   List<Countries> countriesList =
   parsed.map<Countries>((json) => Countries.fromJson(json)).toList();
   return countriesList;


  }





}
