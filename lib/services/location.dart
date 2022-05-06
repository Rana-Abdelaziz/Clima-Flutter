import 'package:geolocator/geolocator.dart';

class location_Service {
  double Longitude;
  double Latitude;
  Future<void> getLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      Longitude = position.longitude;
      Latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
