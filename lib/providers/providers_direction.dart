import 'package:flutter/material.dart';
import 'package:technical_test_karlo_indonesia/models/direction_models.dart';
import 'package:technical_test_karlo_indonesia/services/services_direction.dart';



class ProvidersDirection with ChangeNotifier {
  DirectionModels data = DirectionModels();

  bool loading = false;
  ServicesDirection services = ServicesDirection();


  Future<void> getPostData(context) async {
    loading = true;

    data = await services.getData(context );


    loading = false;

    notifyListeners();
  }
}
