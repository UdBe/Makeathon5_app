import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';


BearingBetween(Position userPosition) {
  double distance = Geolocator.distanceBetween(
      userPosition.latitude, userPosition.longitude, 30.3552489, 76.3702122);
  return distance;
}

Future<double> geofenceUser(context) async {
  bool serviceEnabled;
  LocationPermission permission;

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  double distance = await BearingBetween(position);
  return distance;
}
