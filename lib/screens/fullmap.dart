import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:technical_test_karlo_indonesia/providers/providers_direction.dart';
import 'package:technical_test_karlo_indonesia/providers/providers_geo.dart';

import 'package:technical_test_karlo_indonesia/widget/customTextField.dart';
import 'package:technical_test_karlo_indonesia/widget/custombutton.dart';
import 'package:technical_test_karlo_indonesia/widget/table.dart';

class FullMap extends StatefulWidget {
  const FullMap();

  @override
  State createState() => FullMapState();
}

class FullMapState extends State<FullMap> {
  PointAnnotationManager? pointAnnotationManager;
  MapboxMap? mapboxMap;
  bool fullscreenStatus = true;
  bool submitTextField = false;
  bool submitTextField2 = false;
      double? ruteLongitude = 0;
    double? ruteLatitude = 0;
  double? latitude = 0;
  double? longitude = 0;
  var isLight = true;

  double zoom = 0;

  final StreamController<Map<String, double>> _coordinateStreamController =
      StreamController<Map<String, double>>();
       @override
  void initState() {
    super.initState();
    Provider.of<ProvidersDirection>(context, listen: false)
        .getPostData(context);
  }


  @override
  void dispose() {
    _coordinateStreamController.close();
    super.dispose();
  }

  _onMapCreated(MapboxMap mapboxMap) async {
    this.mapboxMap = mapboxMap;
    pointAnnotationManager =
        await mapboxMap.annotations.createPointAnnotationManager();

    if (latitude != null && longitude != null) {
      await _addMarker(latitude!, longitude!);
    }





  
    
  }

  _addMarker(double latitude, double longitude) async {
    if (latitude != 0.0 && longitude != 0.0) {
      if (pointAnnotationManager != null) {
        final ByteData bytes = await rootBundle.load('assets/pin.png');
        final Uint8List imageData = bytes.buffer.asUint8List();

        PointAnnotationOptions pointAnnotationOptions = PointAnnotationOptions(
          geometry: Point(coordinates: Position(longitude, latitude)),
          image: imageData,
          iconSize: 0.08,
        );

        pointAnnotationManager?.create(pointAnnotationOptions);
      }
    }
  }
  

 
  _onCameraChangeListener(CameraChangedEventData data) {
    print("CameraChangedEventData: timestamp: ${data.timestamp}");
  }

  final TextEditingController _latitude = TextEditingController();
  final TextEditingController _longitude = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final getGeoData = Provider.of<ProvidersGeo>(context);
    final forBtConsume = getGeoData.data.features;

    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder<Map<String, double>>(
            stream: _coordinateStreamController.stream,
            builder: (context, snapshot) {
              double latitude = 0.0;
              double longitude = 0.0;

              if (snapshot.hasData) {
                final coordinates = snapshot.data!;
                latitude = coordinates['latitude'] ?? 0.0;
                longitude = coordinates['longitude'] ?? 0.0;
              }

              return Positioned.fill(
                child: MapWidget(
                  key: ValueKey("mapWidget_${latitude}_${longitude}"),
                  cameraOptions: CameraOptions(
                    center: Point(coordinates: Position(longitude, latitude)),
                    zoom: zoom,
                  ),
                  styleUri: MapboxStyles.MAPBOX_STREETS,
                  textureView: true,
                  onMapCreated: _onMapCreated,
                  onLongTapListener: (coordinate) {},
                  onCameraChangeListener: _onCameraChangeListener,
                ),
              );
            },
          ),
          fullscreenStatus == false
              ? Positioned(
                  top: 40,
                  left: 16,
                  right: 16,
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(200, 255, 255, 255),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomTextField(
                              onChanged: (value) {
                                setState(() {
                                  Provider.of<ProvidersGeo>(context,
                                          listen: false)
                                      .getPostData(context, value);
                                  submitTextField = value.isNotEmpty;
                                  ruteLongitude = forBtConsume?[0]
                                          .properties
                                          ?.coordinates
                                          ?.longitude ??
                                      0.0;
                                });
                              },
                              text: "Address or Lat or Long",
                              controller: _latitude,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomTextField(
                              onChanged: (value) {
                                setState(() {
                                  Provider.of<ProvidersGeo>(context,
                                          listen: false)
                                      .getPostData(context, value);
                                  submitTextField2 = value.isNotEmpty;
                                  ruteLatitude = forBtConsume?[0]
                                          .properties
                                          ?.coordinates
                                          ?.latitude ??
                                      0.0;

                                });
                              },
                              text: "Address or Lat or Long",
                              controller: _longitude,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomButton(
                              text: "Rute",
                              height: 50,
                              width: 100,
                              color: Colors.green,
                              colorText: Colors.white,
                              onPressed: () {
                                print('rute:${ruteLatitude }');
                                  print('rute long:${ruteLongitude }');
                              },
                            ),
                            CustomButton(
                              text: "Search",
                              height: 50,
                              width: 100,
                              color: Colors.green,
                              colorText: Colors.white,
                              onPressed: () {
                                setState(() {
                                  latitude = forBtConsume?[0]
                                          .properties
                                          ?.coordinates
                                          ?.latitude ??
                                      0.0;
                                  longitude = forBtConsume?[0]
                                          .properties
                                          ?.coordinates
                                          ?.longitude ??
                                      0.0;
                                  zoom = 15;

                                  _coordinateStreamController.sink.add({
                                    'latitude': latitude ?? 0.0,
                                    'longitude': longitude ?? 0.0,
                                  });

                                  if (mapboxMap != null) {
                                    _addMarker(latitude!, longitude!);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
          submitTextField == true
              ? Positioned(
                  top: 200,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      height: 300,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(249, 255, 255, 255),
                      ),
                      child: ListView.builder(
                        itemCount: getGeoData.data.features?.length,
                        itemBuilder: (context, index) {
                          final consumeData = getGeoData.data.features?[index];
                          return TableCustom(
                            onPressed: () async {
                              _latitude.text =
                                  consumeData?.properties?.fullAddress ?? "";

                              setState(() {
                                submitTextField = false;
                              });
                              if (_latitude.text.isEmpty) {
                                setState(() {
                                  _latitude.clear();
                                });
                              }
                            },
                            title: consumeData?.properties?.fullAddress ?? "",
                            subtitle: consumeData?.properties?.name ?? "",
                          );
                        },
                      ),
                    ),
                  ),
                )
              : Container(),
          submitTextField2 == true
              ? Positioned(
                  top: 200,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      height: 300,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(249, 255, 255, 255),
                      ),
                      child: ListView.builder(
                        itemCount: getGeoData.data.features?.length,
                        itemBuilder: (context, index) {
                          final consumeData = getGeoData.data.features?[index];
                          return TableCustom(
                            onPressed: () async {
                              _longitude.text =
                                  consumeData?.properties?.fullAddress ?? "";

                              setState(() {
                                submitTextField2 = false;
                              });
                              if (_longitude.text.isEmpty) {
                                setState(() {
                                  _longitude.clear();
                                });
                              }
                            },
                            title: consumeData?.properties?.fullAddress ?? "",
                            subtitle: consumeData?.properties?.name ?? "",
                          );
                        },
                      ),
                    ),
                  ),
                )
              : Container(),
          fullscreenStatus == false
              ? Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CustomButton(
                      text: "Full screen",
                      height: 50,
                      width: 120,
                      color: Colors.green,
                      colorText: Colors.white,
                      onPressed: () {
                        setState(() {
                          fullscreenStatus = true;
                        });
                      },
                    ),
                  ),
                )
              : Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CustomButton(
                      text: "Search location",
                      height: 50,
                      width: 140,
                      color: Colors.green,
                      colorText: Colors.white,
                      onPressed: () {
                        setState(() {
                          fullscreenStatus = false;
                        });
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
