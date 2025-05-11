import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/widgets/custom_elevated_button.dart';
import 'package:fada_alhalij_web/features/cart/data/models/response/addresses_user_dto.dart';
import 'package:fada_alhalij_web/features/cart/presentation/cubit/address/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'add_address.dart';
import 'list_address_user.dart';

class AddressesView extends StatefulWidget {
  const AddressesView({super.key});

  @override
  State<AddressesView> createState() => _AddressesViewState();
}

class _AddressesViewState extends State<AddressesView> {
  late AddressCubit viewModel;

  @override
  void initState() {
    viewModel = getIt.get<AddressCubit>();
    viewModel.getAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          if (state is AddressSuccess) {
            List<AddressesData>? addresses =
                state.addressesUserEntity.addressesData ?? [];
            // return Text("data");
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " التوصيل الي:",
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: getSemiBoldStyle(
                    fontSize: 14,
                    color: ColorManager.darkTextColor,
                  ),
                ),
                ListAddressUser(addresses: addresses),
                Align(
                  alignment: Alignment.center,
                  child: CustomElevatedButton(
                    buttonColor: ColorManager.primaryColor,
                    title: "اضافة عنوان جديد",
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return AddAddress(viewModel: viewModel);
                        },
                      );
                    },
                  ),
                ),

                Text(
                  "تفاصيل الطلب التوصيل",
                  style: getSemiBoldStyle(
                    color: ColorManager.primaryColor,
                    fontSize: 20,
                  ),
                ),


              ],
            );
          }

          return Skeletonizer(
            child: Card(
              color: ColorManager.white.withAlpha(200),
              elevation: 4,
              child: ListTile(
                onTap: () {},
                leading: Icon(Icons.location_on, color: ColorManager.black),

                title: Text(
                  "aasasas",
                  style: getSemiBoldStyle(
                    color: ColorManager.black,
                    fontSize: 12,
                  ),
                ),
                subtitle: Text(
                  "sdsdsadsadsda",
                  style: getSemiBoldStyle(
                    color: ColorManager.black,
                    fontSize: 12,
                  ),
                ),
                trailing: Radio<int>(
                  value: 1,
                  activeColor: ColorManager.black,
                  groupValue: 1,
                  onChanged: (value) {},
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
