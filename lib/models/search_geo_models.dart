// To parse this JSON data, do
//
//     final searchGeoModels = searchGeoModelsFromJson(jsonString);

import 'dart:convert';

SearchGeoModels searchGeoModelsFromJson(String str) => SearchGeoModels.fromJson(json.decode(str));

String searchGeoModelsToJson(SearchGeoModels data) => json.encode(data.toJson());

class SearchGeoModels {
    String? type;
    List<Feature>? features;
    String? attribution;

    SearchGeoModels({
        this.type,
        this.features,
        this.attribution,
    });

    factory SearchGeoModels.fromJson(Map<String, dynamic> json) => SearchGeoModels(
        type: json["type"],
        features: json["features"] == null ? [] : List<Feature>.from(json["features"]!.map((x) => Feature.fromJson(x))),
        attribution: json["attribution"],
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x.toJson())),
        "attribution": attribution,
    };
}

class Feature {
    String? type;
    String? id;
    Geometry? geometry;
    Properties? properties;

    Feature({
        this.type,
        this.id,
        this.geometry,
        this.properties,
    });

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        type: json["type"],
        id: json["id"],
        geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
        properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "geometry": geometry?.toJson(),
        "properties": properties?.toJson(),
    };
}

class Geometry {
    String? type;
    List<double>? coordinates;

    Geometry({
        this.type,
        this.coordinates,
    });

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
    };
}

class Properties {
    String? mapboxId;
    String? featureType;
    String? fullAddress;
    String? name;
    String? namePreferred;
    Coordinates? coordinates;
    String? placeFormatted;
    List<double>? bbox;
    Context? context;

    Properties({
        this.mapboxId,
        this.featureType,
        this.fullAddress,
        this.name,
        this.namePreferred,
        this.coordinates,
        this.placeFormatted,
        this.bbox,
        this.context,
    });

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        mapboxId: json["mapbox_id"],
        featureType: json["feature_type"],
        fullAddress: json["full_address"],
        name: json["name"],
        namePreferred: json["name_preferred"],
        coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
        placeFormatted: json["place_formatted"],
        bbox: json["bbox"] == null ? [] : List<double>.from(json["bbox"]!.map((x) => x?.toDouble())),
        context: json["context"] == null ? null : Context.fromJson(json["context"]),
    );

    Map<String, dynamic> toJson() => {
        "mapbox_id": mapboxId,
        "feature_type": featureType,
        "full_address": fullAddress,
        "name": name,
        "name_preferred": namePreferred,
        "coordinates": coordinates?.toJson(),
        "place_formatted": placeFormatted,
        "bbox": bbox == null ? [] : List<dynamic>.from(bbox!.map((x) => x)),
        "context": context?.toJson(),
    };
}

class Context {
    Locality? place;
    Region? region;
    Country? country;
    Locality? locality;
    Postcode? postcode;
    Locality? neighborhood;

    Context({
        this.place,
        this.region,
        this.country,
        this.locality,
        this.postcode,
        this.neighborhood,
    });

    factory Context.fromJson(Map<String, dynamic> json) => Context(
        place: json["place"] == null ? null : Locality.fromJson(json["place"]),
        region: json["region"] == null ? null : Region.fromJson(json["region"]),
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
        locality: json["locality"] == null ? null : Locality.fromJson(json["locality"]),
        postcode: json["postcode"] == null ? null : Postcode.fromJson(json["postcode"]),
        neighborhood: json["neighborhood"] == null ? null : Locality.fromJson(json["neighborhood"]),
    );

    Map<String, dynamic> toJson() => {
        "place": place?.toJson(),
        "region": region?.toJson(),
        "country": country?.toJson(),
        "locality": locality?.toJson(),
        "postcode": postcode?.toJson(),
        "neighborhood": neighborhood?.toJson(),
    };
}

class Country {
    String? mapboxId;
    String? name;
    String? wikidataId;
    String? countryCode;
    String? countryCodeAlpha3;

    Country({
        this.mapboxId,
        this.name,
        this.wikidataId,
        this.countryCode,
        this.countryCodeAlpha3,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        mapboxId: json["mapbox_id"],
        name: json["name"],
        wikidataId: json["wikidata_id"],
        countryCode: json["country_code"],
        countryCodeAlpha3: json["country_code_alpha_3"],
    );

    Map<String, dynamic> toJson() => {
        "mapbox_id": mapboxId,
        "name": name,
        "wikidata_id": wikidataId,
        "country_code": countryCode,
        "country_code_alpha_3": countryCodeAlpha3,
    };
}

class Locality {
    String? mapboxId;
    String? name;
    String? wikidataId;
    String? shortCode;

    Locality({
        this.mapboxId,
        this.name,
        this.wikidataId,
        this.shortCode,
    });

    factory Locality.fromJson(Map<String, dynamic> json) => Locality(
        mapboxId: json["mapbox_id"],
        name: json["name"],
        wikidataId: json["wikidata_id"],
        shortCode: json["short_code"],
    );

    Map<String, dynamic> toJson() => {
        "mapbox_id": mapboxId,
        "name": name,
        "wikidata_id": wikidataId,
        "short_code": shortCode,
    };
}

class Postcode {
    String? mapboxId;
    String? name;

    Postcode({
        this.mapboxId,
        this.name,
    });

    factory Postcode.fromJson(Map<String, dynamic> json) => Postcode(
        mapboxId: json["mapbox_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "mapbox_id": mapboxId,
        "name": name,
    };
}

class Region {
    String? mapboxId;
    String? name;
    String? wikidataId;
    String? regionCode;
    String? regionCodeFull;

    Region({
        this.mapboxId,
        this.name,
        this.wikidataId,
        this.regionCode,
        this.regionCodeFull,
    });

    factory Region.fromJson(Map<String, dynamic> json) => Region(
        mapboxId: json["mapbox_id"],
        name: json["name"],
        wikidataId: json["wikidata_id"],
        regionCode: json["region_code"],
        regionCodeFull: json["region_code_full"],
    );

    Map<String, dynamic> toJson() => {
        "mapbox_id": mapboxId,
        "name": name,
        "wikidata_id": wikidataId,
        "region_code": regionCode,
        "region_code_full": regionCodeFull,
    };
}

class Coordinates {
    double? longitude;
    double? latitude;

    Coordinates({
        this.longitude,
        this.latitude,
    });

    factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        longitude: json["longitude"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "longitude": longitude,
        "latitude": latitude,
    };
}
