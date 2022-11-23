import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      print("The level of permission is  :");
      print(permission);
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        Position position = await Geolocator.getCurrentPosition(
            forceAndroidLocationManager: true,
            desiredAccuracy: LocationAccuracy.low);
        latitude = position.latitude;
        longitude = position.longitude;
        print(latitude);
        print(longitude);
      } else {
        print(
            "There is not enough permissions given to this app to use the location");
        latitude = -15.9857254;
        longitude = 18.0885778;
      }
    } catch (e) {
      print(e);
      latitude = -15.9857254;
      longitude = 18.0885778;
    }
  }
}
