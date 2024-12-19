// To parse this JSON data, do
//
//     final directionModels = directionModelsFromJson(jsonString);

import 'dart:convert';

DirectionModels directionModelsFromJson(String str) => DirectionModels.fromJson(json.decode(str));

String directionModelsToJson(DirectionModels data) => json.encode(data.toJson());

class DirectionModels {
    List<Route>? routes;
    List<Waypoint>? waypoints;
    String? code;
    String? uuid;

    DirectionModels({
        this.routes,
        this.waypoints,
        this.code,
        this.uuid,
    });

    factory DirectionModels.fromJson(Map<String, dynamic> json) => DirectionModels(
        routes: json["routes"] == null ? [] : List<Route>.from(json["routes"]!.map((x) => Route.fromJson(x))),
        waypoints: json["waypoints"] == null ? [] : List<Waypoint>.from(json["waypoints"]!.map((x) => Waypoint.fromJson(x))),
        code: json["code"],
        uuid: json["uuid"],
    );

    Map<String, dynamic> toJson() => {
        "routes": routes == null ? [] : List<dynamic>.from(routes!.map((x) => x.toJson())),
        "waypoints": waypoints == null ? [] : List<dynamic>.from(waypoints!.map((x) => x.toJson())),
        "code": code,
        "uuid": uuid,
    };
}

class Route {
    String? weightName;
    double? weight;
    double? duration;
    double? distance;
    List<Leg>? legs;
    Geometry? geometry;

    Route({
        this.weightName,
        this.weight,
        this.duration,
        this.distance,
        this.legs,
        this.geometry,
    });

    factory Route.fromJson(Map<String, dynamic> json) => Route(
        weightName: json["weight_name"],
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        distance: json["distance"]?.toDouble(),
        legs: json["legs"] == null ? [] : List<Leg>.from(json["legs"]!.map((x) => Leg.fromJson(x))),
        geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
    );

    Map<String, dynamic> toJson() => {
        "weight_name": weightName,
        "weight": weight,
        "duration": duration,
        "distance": distance,
        "legs": legs == null ? [] : List<dynamic>.from(legs!.map((x) => x.toJson())),
        "geometry": geometry?.toJson(),
    };
}

class Geometry {
    List<List<double>>? coordinates;
    Type? type;

    Geometry({
        this.coordinates,
        this.type,
    });

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        coordinates: json["coordinates"] == null ? [] : List<List<double>>.from(json["coordinates"]!.map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        type: typeValues.map[json["type"]]!,
    );

    Map<String, dynamic> toJson() => {
        "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "type": typeValues.reverse[type],
    };
}

enum Type {
    LINE_STRING
}

final typeValues = EnumValues({
    "LineString": Type.LINE_STRING
});

class Leg {
    List<dynamic>? viaWaypoints;
    List<Admin>? admins;
    double? weight;
    double? duration;
    Sirns? sirns;
    List<Step>? steps;
    double? distance;
    String? summary;

    Leg({
        this.viaWaypoints,
        this.admins,
        this.weight,
        this.duration,
        this.sirns,
        this.steps,
        this.distance,
        this.summary,
    });

    factory Leg.fromJson(Map<String, dynamic> json) => Leg(
        viaWaypoints: json["via_waypoints"] == null ? [] : List<dynamic>.from(json["via_waypoints"]!.map((x) => x)),
        admins: json["admins"] == null ? [] : List<Admin>.from(json["admins"]!.map((x) => Admin.fromJson(x))),
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        sirns: json["sirns"] == null ? null : Sirns.fromJson(json["sirns"]),
        steps: json["steps"] == null ? [] : List<Step>.from(json["steps"]!.map((x) => Step.fromJson(x))),
        distance: json["distance"]?.toDouble(),
        summary: json["summary"],
    );

    Map<String, dynamic> toJson() => {
        "via_waypoints": viaWaypoints == null ? [] : List<dynamic>.from(viaWaypoints!.map((x) => x)),
        "admins": admins == null ? [] : List<dynamic>.from(admins!.map((x) => x.toJson())),
        "weight": weight,
        "duration": duration,
        "sirns": sirns?.toJson(),
        "steps": steps == null ? [] : List<dynamic>.from(steps!.map((x) => x.toJson())),
        "distance": distance,
        "summary": summary,
    };
}

class Admin {
    String? iso31661Alpha3;
    String? iso31661;

    Admin({
        this.iso31661Alpha3,
        this.iso31661,
    });

    factory Admin.fromJson(Map<String, dynamic> json) => Admin(
        iso31661Alpha3: json["iso_3166_1_alpha3"],
        iso31661: json["iso_3166_1"],
    );

    Map<String, dynamic> toJson() => {
        "iso_3166_1_alpha3": iso31661Alpha3,
        "iso_3166_1": iso31661,
    };
}

class Sirns {
    Sirns();

    factory Sirns.fromJson(Map<String, dynamic> json) => Sirns(
    );

    Map<String, dynamic> toJson() => {
    };
}

class Step {
    List<Intersection>? intersections;
    Maneuver? maneuver;
    String? name;
    double? duration;
    double? distance;
    DrivingSide? drivingSide;
    double? weight;
    Mode? mode;
    Geometry? geometry;
    String? destinations;
    String? ref;

    Step({
        this.intersections,
        this.maneuver,
        this.name,
        this.duration,
        this.distance,
        this.drivingSide,
        this.weight,
        this.mode,
        this.geometry,
        this.destinations,
        this.ref,
    });

    factory Step.fromJson(Map<String, dynamic> json) => Step(
        intersections: json["intersections"] == null ? [] : List<Intersection>.from(json["intersections"]!.map((x) => Intersection.fromJson(x))),
        maneuver: json["maneuver"] == null ? null : Maneuver.fromJson(json["maneuver"]),
        name: json["name"],
        duration: json["duration"]?.toDouble(),
        distance: json["distance"]?.toDouble(),
        drivingSide: drivingSideValues.map[json["driving_side"]]!,
        weight: json["weight"]?.toDouble(),
        mode: modeValues.map[json["mode"]]!,
        geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
        destinations: json["destinations"],
        ref: json["ref"],
    );

    Map<String, dynamic> toJson() => {
        "intersections": intersections == null ? [] : List<dynamic>.from(intersections!.map((x) => x.toJson())),
        "maneuver": maneuver?.toJson(),
        "name": name,
        "duration": duration,
        "distance": distance,
        "driving_side": drivingSideValues.reverse[drivingSide],
        "weight": weight,
        "mode": modeValues.reverse[mode],
        "geometry": geometry?.toJson(),
        "destinations": destinations,
        "ref": ref,
    };
}

enum DrivingSide {
    LEFT,
    RIGHT,
    SLIGHT_LEFT,
    SLIGHT_RIGHT,
    UTURN
}

final drivingSideValues = EnumValues({
    "left": DrivingSide.LEFT,
    "right": DrivingSide.RIGHT,
    "slight left": DrivingSide.SLIGHT_LEFT,
    "slight right": DrivingSide.SLIGHT_RIGHT,
    "uturn": DrivingSide.UTURN
});

class Intersection {
    List<int>? bearings;
    List<bool>? entry;
    MapboxStreetsV8? mapboxStreetsV8;
    bool? isUrban;
    int? adminIndex;
    int? out;
    int? geometryIndex;
    List<double>? location;
    int? intersectionIn;
    double? duration;
    double? turnDuration;
    double? weight;
    double? turnWeight;
    bool? trafficSignal;
    List<ClassElement>? classes;
    TollCollection? tollCollection;
    List<Lane>? lanes;
    bool? railwayCrossing;

    Intersection({
        this.bearings,
        this.entry,
        this.mapboxStreetsV8,
        this.isUrban,
        this.adminIndex,
        this.out,
        this.geometryIndex,
        this.location,
        this.intersectionIn,
        this.duration,
        this.turnDuration,
        this.weight,
        this.turnWeight,
        this.trafficSignal,
        this.classes,
        this.tollCollection,
        this.lanes,
        this.railwayCrossing,
    });

    factory Intersection.fromJson(Map<String, dynamic> json) => Intersection(
        bearings: json["bearings"] == null ? [] : List<int>.from(json["bearings"]!.map((x) => x)),
        entry: json["entry"] == null ? [] : List<bool>.from(json["entry"]!.map((x) => x)),
        mapboxStreetsV8: json["mapbox_streets_v8"] == null ? null : MapboxStreetsV8.fromJson(json["mapbox_streets_v8"]),
        isUrban: json["is_urban"],
        adminIndex: json["admin_index"],
        out: json["out"],
        geometryIndex: json["geometry_index"],
        location: json["location"] == null ? [] : List<double>.from(json["location"]!.map((x) => x?.toDouble())),
        intersectionIn: json["in"],
        duration: json["duration"]?.toDouble(),
        turnDuration: json["turn_duration"]?.toDouble(),
        weight: json["weight"]?.toDouble(),
        turnWeight: json["turn_weight"]?.toDouble(),
        trafficSignal: json["traffic_signal"],
        classes: json["classes"] == null ? [] : List<ClassElement>.from(json["classes"]!.map((x) => classElementValues.map[x]!)),
        tollCollection: json["toll_collection"] == null ? null : TollCollection.fromJson(json["toll_collection"]),
        lanes: json["lanes"] == null ? [] : List<Lane>.from(json["lanes"]!.map((x) => Lane.fromJson(x))),
        railwayCrossing: json["railway_crossing"],
    );

    Map<String, dynamic> toJson() => {
        "bearings": bearings == null ? [] : List<dynamic>.from(bearings!.map((x) => x)),
        "entry": entry == null ? [] : List<dynamic>.from(entry!.map((x) => x)),
        "mapbox_streets_v8": mapboxStreetsV8?.toJson(),
        "is_urban": isUrban,
        "admin_index": adminIndex,
        "out": out,
        "geometry_index": geometryIndex,
        "location": location == null ? [] : List<dynamic>.from(location!.map((x) => x)),
        "in": intersectionIn,
        "duration": duration,
        "turn_duration": turnDuration,
        "weight": weight,
        "turn_weight": turnWeight,
        "traffic_signal": trafficSignal,
        "classes": classes == null ? [] : List<dynamic>.from(classes!.map((x) => classElementValues.reverse[x])),
        "toll_collection": tollCollection?.toJson(),
        "lanes": lanes == null ? [] : List<dynamic>.from(lanes!.map((x) => x.toJson())),
        "railway_crossing": railwayCrossing,
    };
}

enum ClassElement {
    MOTORWAY,
    TOLL,
    TUNNEL
}

final classElementValues = EnumValues({
    "motorway": ClassElement.MOTORWAY,
    "toll": ClassElement.TOLL,
    "tunnel": ClassElement.TUNNEL
});

class Lane {
    List<Indication>? indications;
    Indication? validIndication;
    bool? valid;
    bool? active;

    Lane({
        this.indications,
        this.validIndication,
        this.valid,
        this.active,
    });

    factory Lane.fromJson(Map<String, dynamic> json) => Lane(
        indications: json["indications"] == null ? [] : List<Indication>.from(json["indications"]!.map((x) => indicationValues.map[x]!)),
        validIndication: indicationValues.map[json["valid_indication"]]!,
        valid: json["valid"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "indications": indications == null ? [] : List<dynamic>.from(indications!.map((x) => indicationValues.reverse[x])),
        "valid_indication": indicationValues.reverse[validIndication],
        "valid": valid,
        "active": active,
    };
}

enum Indication {
    SLIGHT_LEFT,
    STRAIGHT
}

final indicationValues = EnumValues({
    "slight left": Indication.SLIGHT_LEFT,
    "straight": Indication.STRAIGHT
});

class MapboxStreetsV8 {
    MapboxStreetsV8Class? mapboxStreetsV8Class;

    MapboxStreetsV8({
        this.mapboxStreetsV8Class,
    });

    factory MapboxStreetsV8.fromJson(Map<String, dynamic> json) => MapboxStreetsV8(
        mapboxStreetsV8Class: mapboxStreetsV8ClassValues.map[json["class"]]!,
    );

    Map<String, dynamic> toJson() => {
        "class": mapboxStreetsV8ClassValues.reverse[mapboxStreetsV8Class],
    };
}

enum MapboxStreetsV8Class {
    MOTORWAY,
    MOTORWAY_LINK,
    PRIMARY,
    PRIMARY_LINK,
    STREET,
    TERTIARY,
    TERTIARY_LINK,
    TRUNK,
    TRUNK_LINK
}

final mapboxStreetsV8ClassValues = EnumValues({
    "motorway": MapboxStreetsV8Class.MOTORWAY,
    "motorway_link": MapboxStreetsV8Class.MOTORWAY_LINK,
    "primary": MapboxStreetsV8Class.PRIMARY,
    "primary_link": MapboxStreetsV8Class.PRIMARY_LINK,
    "street": MapboxStreetsV8Class.STREET,
    "tertiary": MapboxStreetsV8Class.TERTIARY,
    "tertiary_link": MapboxStreetsV8Class.TERTIARY_LINK,
    "trunk": MapboxStreetsV8Class.TRUNK,
    "trunk_link": MapboxStreetsV8Class.TRUNK_LINK
});

class TollCollection {
    String? name;
    String? type;

    TollCollection({
        this.name,
        this.type,
    });

    factory TollCollection.fromJson(Map<String, dynamic> json) => TollCollection(
        name: json["name"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
    };
}

class Maneuver {
    String? type;
    String? instruction;
    int? bearingAfter;
    int? bearingBefore;
    List<double>? location;
    DrivingSide? modifier;

    Maneuver({
        this.type,
        this.instruction,
        this.bearingAfter,
        this.bearingBefore,
        this.location,
        this.modifier,
    });

    factory Maneuver.fromJson(Map<String, dynamic> json) => Maneuver(
        type: json["type"],
        instruction: json["instruction"],
        bearingAfter: json["bearing_after"],
        bearingBefore: json["bearing_before"],
        location: json["location"] == null ? [] : List<double>.from(json["location"]!.map((x) => x?.toDouble())),
        modifier: drivingSideValues.map[json["modifier"]]!,
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "instruction": instruction,
        "bearing_after": bearingAfter,
        "bearing_before": bearingBefore,
        "location": location == null ? [] : List<dynamic>.from(location!.map((x) => x)),
        "modifier": drivingSideValues.reverse[modifier],
    };
}

enum Mode {
    DRIVING
}

final modeValues = EnumValues({
    "driving": Mode.DRIVING
});

class Waypoint {
    int? distance;
    String? name;
    List<double>? location;

    Waypoint({
        this.distance,
        this.name,
        this.location,
    });

    factory Waypoint.fromJson(Map<String, dynamic> json) => Waypoint(
        distance: json["distance"],
        name: json["name"],
        location: json["location"] == null ? [] : List<double>.from(json["location"]!.map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "distance": distance,
        "name": name,
        "location": location == null ? [] : List<dynamic>.from(location!.map((x) => x)),
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
