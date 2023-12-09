import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:muslim_app/app/data/models/sholat.dart';
import 'package:muslim_app/app/data/models/user_location.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  Future<bool> permissionDevice() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      Future.error('Location service Not Enabled');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Future.error('Location permission denied');
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Future.error(
        'Location permission denied forever, we cannot access',
      );
      return false;
    }
    return true;
  }

  Future<UserLocation> getCurrentPosition() async {
    final hasPermission = await permissionDevice();
    if (!hasPermission) {
      return Future.error('Gagal');
    }
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemark[0];
    // String? city = place.subAdministrativeArea?.replaceFirst('Kota ', '');
    String? city = place.subAdministrativeArea;
    String? country = place.country;
    return UserLocation(city: city, country: country);
  }

  Future<Sholat> getSholat(String city, String country, String date) async {
    var url = Uri.parse(
        'https://api.aladhan.com/v1/timingsByCity/$date?city=$city&country=$country&method=20');
    var response = await http.get(url);

    Map<String, dynamic> data =
        (json.decode(response.body) as Map<String, dynamic>)['data'];

    return Sholat.fromJson(data);
  }
}
