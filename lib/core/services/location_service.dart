import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';

class LocationService {
  Position? currentLocation;
  double? latitude;
  double? longtitude;
  String? cityAddress;
  String? countryAddress;
  GeoPoint? geoPoint;

  Future<GeoPoint?> getCurrentLocation() async {
    currentLocation = await Geolocator.getCurrentPosition();
    if (currentLocation == null) {
      print("Aliiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
      await checkPermissionStatus();
      await checkGpsService();
    } else {
      geoPoint = 
          GeoPoint(currentLocation!.latitude, currentLocation!.longitude);
      latitude = currentLocation!.latitude;
      longtitude = currentLocation!.longitude;
      print("Umairrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      // _getAddressFromLatLng();
    }
    print('${currentLocation!.latitude}, ${currentLocation!.longitude}');
    return geoPoint;
  }

  checkPermissionStatus() async {
    LocationPermission permission = await checkPermissionStatus();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      await PermissionStatus.denied;
    }
  }

  checkGpsService() async {
    if (await Geolocator.isLocationServiceEnabled()) {
      Get.defaultDialog(
          title: 'GPS is Disabled',
          middleText: 'Please turn on your GPS Location',
          textConfirm: 'TURN ON',
          onConfirm: () async {
            await Geolocator.openLocationSettings();
            Get.back();
          },
          textCancel: 'Skip',
          onCancel: () {});

      // showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         title: Text('GPS is Disabled'),
      //         content: Text('Please turn on your GPS Location'),
      //         actions: [
      //           ElevatedButton(
      //             child: Text('TURN ON'),
      //             onPressed: () async {
      //               await Geolocator.openLocationSettings();
      //               Navigator.pop(context);
      //             },
      //           ),
      //           ElevatedButton(
      //             child: Text('Skip'),
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //           ),
      //         ],
      //       );
      //     });
    }
  }

  // getLocation() async {
  //   Position res =
  //       await Geolocator.getCurrentPosition().timeout(new Duration(seconds: 5));
  // _position = res;
  // latitude = _position!.latitude;
  // longtitude = _position!.longitude;

  //   _getAddressFromLatLng();
  // }

  static getAddressFromLatLng(location) async {
    String cityAddress;
    String countryAddress;
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          location!.latitude, location!.longitude);

      Placemark place = placemarks[0];

      cityAddress = " ${place.locality.toString()}";
      countryAddress = "${place.country.toString()}";

      print("the location is  $cityAddress " + "$countryAddress");
    } catch (e) {
      print("the exception is $e");
    }
  }
}
