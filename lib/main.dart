import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_karlo_indonesia/providers/providers_direction.dart';
import 'package:technical_test_karlo_indonesia/providers/providers_geo.dart';
// import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import 'package:technical_test_karlo_indonesia/route.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProvidersGeo>(create: (_) => ProvidersGeo()),
        ChangeNotifierProvider<ProvidersDirection>(
            create: (_) => ProvidersDirection()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: AppRoute().onGenerateRoute,
    );
  }
}
