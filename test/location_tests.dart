import 'package:test/test.dart';
import 'package:weatherapp/models/location.dart';

// Tests to implement:
  // Creating a location object using the normal constructor
  // Creating a Location object from a json (toJson() function)
  // Getting json data from a Location object (fromJson() function)
  // Comparing two locations for equality (use an equal example which returns True, and an unequal example which returns false)

void main(){
  group("Location Model:", () {
    const Map<String, dynamic> attr = {
      "state" : "OR",
      "city" : "Bend",
      "zip" : "97701",
      "latitude" : 45.71,
      "longitude" : -122.31,
      "url": "Some URL"
    };

    test("An instance can be created using the normal constructor", () {
      final Location loc = Location(
        state: attr["state"],
        city: attr["city"],
        zip: attr["zip"],
        latitude: attr["latitude"],
        longitude: attr["longitude"],
        url: attr["url"]
      );

      expect(loc.state, attr["state"]);
      expect(loc.city, attr["city"]);
      expect(loc.zip, attr["zip"]);
      expect(loc.latitude, attr["latitude"]);
      expect(loc.longitude, attr["longitude"]);
    });

    test("An instance can be created using a json map", () {
      final Location loc = Location.fromJson(attr);

      expect(loc.state, attr["state"]);
      expect(loc.city, attr["city"]);
      expect(loc.zip, attr["zip"]);
      expect(loc.latitude, attr["latitude"]);
      expect(loc.longitude, attr["longitude"]);
    });

    test("A map representation of an instance can be created", () {

      final Location loc = Location.fromJson(attr);
      Map<String, dynamic> map = loc.toJson();
      expect(map, attr);
      
    });

    test("Two equivalent location objects should be equivalent", () {
      final Location loc1 = Location.fromJson(attr);
      final Location loc2 = Location.fromJson(attr);
      
      expect(loc1, loc2);
    });

    test("Two non equivalent location objects should not be equivalent", () {
      final Location loc1 = Location.fromJson({
        "state" : "OR",
        "city" : "Portland",
        "zip" : "97777",
        "latitude" : 45.71,
        "longitude" : -122.31,
        "url": "Another URL"
      });

      final Location loc2 = Location.fromJson(attr);
      
      expect(loc1 != loc2, true);
    });
  });
}