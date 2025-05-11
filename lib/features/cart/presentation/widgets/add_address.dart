import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/widgets/custom_elevated_button.dart';
import 'package:fada_alhalij_web/features/cart/presentation/cubit/address/address_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_web/geolocator_web.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key, required this.viewModel});
final AddressCubit viewModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomElevatedButton(
            buttonColor: ColorManager.blue,
            onPressed: () {
              getLocation(viewModel);
            },
            title: "اضغط للحصول على الموقع",
          ),
          TextFormField(
            controller: viewModel.titleController,
            decoration: const InputDecoration(labelText: "اسم العنوان"),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: viewModel.cityController,
            decoration: const InputDecoration(labelText: "المدينة"),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller:viewModel. streetController,
            decoration: const InputDecoration(labelText: "الشارع"),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: viewModel.detailsController,
            decoration: const InputDecoration(labelText: "تفاصيل"),
          ),
          const SizedBox(height: 20),
          CustomElevatedButton(
            buttonColor: ColorManager.green,
            title: "حفظ العنوان",
            onPressed: () async {
              await viewModel.addAddress().then((value) => viewModel.getAddress());
              if(context.mounted) {
                Navigator.of(context, rootNavigator: true).pop();
              }
            },
          ),
        ],
      ),
    );
  }
}



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



