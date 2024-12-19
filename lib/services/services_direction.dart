import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technical_test_karlo_indonesia/models/direction_models.dart';
import 'package:technical_test_karlo_indonesia/widget/toastvalidate.dart';

class ServicesDirection {
  Future<DirectionModels> getData(context) async {
    DirectionModels data = DirectionModels();

    try {
      final response = await http.get(
        Uri.parse(
            'https://api.mapbox.com/directions/v5/mapbox/driving/106.767193%2C-6.197275%3B106.787539%2C-6.200697%3B106.774151%2C-6.169252%3B106.916821%2C-6.236145?alternatives=true&geometries=geojson&language=en&overview=full&steps=true&access_token=pk.eyJ1Ijoia2FybG9kZXYiLCJhIjoiY2xocTN1ZnVjMjB1NDNtcHNoMmI2N2dhcCJ9.5Y8fh8aPfM6f5zDKA_bDiw'),
        headers: {},
      );

      if (response.statusCode == 200) {
        final item = json.decode(response.body);

        var dataa = item['routes'];

        print("Sucesss: $dataa");

        data = DirectionModels.fromJson(item);
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
