import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technical_test_karlo_indonesia/models/search_geo_models.dart';
import 'package:technical_test_karlo_indonesia/widget/toastvalidate.dart';

class ServicesGeo {
  double latitudeServices = 0;
    double longitudeServices = 0;
 
  Future<SearchGeoModels> getData(context, String submitAddresTextField) async {
    SearchGeoModels data = SearchGeoModels();

    try {
      final response = await http.get(
        Uri.parse(
            'https://api.mapbox.com/search/geocode/v6/forward?proximity=ip&access_token=pk.eyJ1Ijoia2FybG9kZXYiLCJhIjoiY2xocTN1ZnVjMjB1NDNtcHNoMmI2N2dhcCJ9.5Y8fh8aPfM6f5zDKA_bDiw&q=$submitAddresTextField'),
        headers: {},
      );

      if (response.statusCode == 200) {
        final item = json.decode(response.body);
 var coordinates = item['features'][0]['geometry']['coordinates']; // Ambil koordinat pertama
          latitudeServices = coordinates[0];  // Latitude terletak di indeks 1
          longitudeServices = coordinates[0];  
           print("LatitudeServices: $latitudeServices, Longitude: $longitudeServices");
        var dataa = item['features'];
print("cek field ${submitAddresTextField}");
        print("Sucesss: $dataa");

        data = SearchGeoModels.fromJson(item);
      } else {
        final item = json.decode(response.body);
        toastValidate("${item['features']}");
        print("else 2 : ${item['features']}");
        print('Error Occurred: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error Occurred: ${e.toString()}');
    }

    return data;
  }
}
