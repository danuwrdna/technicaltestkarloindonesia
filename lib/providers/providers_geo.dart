import 'package:flutter/material.dart';
import 'package:technical_test_karlo_indonesia/models/search_geo_models.dart';
import 'package:technical_test_karlo_indonesia/services/services_geo.dart';

class ProvidersGeo with ChangeNotifier {
  SearchGeoModels data = SearchGeoModels();

  bool loading = false;
  ServicesGeo services = ServicesGeo();


  Future<void> getPostData(context, String input) async {
    loading = true;

    data = await services.getData(context, input );


    loading = false;

    notifyListeners();
  }
}
