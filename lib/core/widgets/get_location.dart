import 'package:fada_alhalij_web/features/cart/presentation/cubit/address/address_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geolocator_web/geolocator_web.dart';
void getLocation(AddressCubit viewModel) async {
  if (kIsWeb) {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      viewModel.latController.text = position.latitude.toString();
      viewModel. longController.text = position.longitude.toString();
      print("Current Location (Web): ${position.latitude}, ${position.longitude}");
    } catch (e) {
      print("Error getting location on Web: $e");
    }
  } else {

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      viewModel.latController.text = position.latitude.toString();
      viewModel. longController.text = position.longitude.toString();
      print("Current Location (Mobile): ${position.latitude}, ${position.longitude}");
    } catch (e) {
      print("Error getting location on Mobile: $e");
    }
  }
}