import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:technical_test_karlo_indonesia/screens/fullmap.dart';
import 'package:technical_test_karlo_indonesia/screens/onboarding.dart';


class AppRoute {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
         case '/':
       
        return MaterialPageRoute(
          builder: (_) =>  const OnBoarding(),
        );
   
      case '/home':
       
        return MaterialPageRoute(
          builder: (_) =>  const FullMap(),
        );
   
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
