import 'dart:ffi';

import 'package:geocoding/geocoding.dart' as geocoding;

// TODO: Create a new class called Location
// This class should store the values of our location:
// city, state, zip, latitude, longitude
// use appropriate data types as well as appropriate null safing for city state zip
// you do not need to create a factory, but you do need the basic contstructor
// use the forecast class as a template to help you

class Location {
  String? state;
  String? city;
  String? zip;
  double? Latitude;
  double? Longitude;

  Location(this.state, this.city, this.zip, this.Latitude, this.Longitude);

  Location.nullLocation() {
    state = "None Given";
    city = "None Given";
    zip = "None Given";
    Latitude = 0000;
    Longitude = 0000;
  }

}

// TODO: set the type of this function to Future<Location?>
// create a Location object from the lat, lon, city, state, and zip
// return the Location if it's found, null if it's not found

Future<Location> getLocationFromAddress(String rawCity, String rawState, String rawZip) async {
  String address = '$rawCity $rawState $rawZip';
  try{ 
    List<geocoding.Location> locations = await geocoding.locationFromAddress(address);
    double lat = locations[0].latitude;
    double lon = locations[0].longitude;
    List<geocoding.Placemark> placemarks = await geocoding.placemarkFromCoordinates(lat, lon);
    String? state = placemarks[0].administrativeArea;
    String? city = placemarks[0].locality;
    String? zip = placemarks[0].postalCode;

    Location locationObj = Location(state, city, zip, lat, lon);

    return locationObj;
  } on geocoding.NoResultFoundException {
    Location locationError = Location.nullLocation();
    return locationError;
  }
}