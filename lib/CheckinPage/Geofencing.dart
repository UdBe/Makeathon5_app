import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

BearingBetween(Position userPosition, GeoPoint eventGeoPoint) {
  print("XXXXXXXXXXXXXXXXX ${eventGeoPoint.latitude}");
  double distance = Geolocator.distanceBetween(userPosition.latitude,
      userPosition.longitude, eventGeoPoint.latitude, eventGeoPoint.longitude);
  return distance;
}

Future<double> geofenceUser(context) async {
  bool serviceEnabled;
  LocationPermission permission;
  GeoPoint eventGeoPoint;

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

  eventGeoPoint = await getEventLocation();

  double distance = await BearingBetween(position, eventGeoPoint);
  return distance;
}

Future<GeoPoint> getEventLocation() async {
  GeoPoint? geoPoint;
  final documentSnapshot =
      await FirebaseFirestore.instance.collection("position").doc("pos").get();
  final data = documentSnapshot.data() as Map<String, dynamic>;
  data.forEach((key, value) {
    if (key == "Location") {
      geoPoint = value;
    }
  });
  return geoPoint!;
}
