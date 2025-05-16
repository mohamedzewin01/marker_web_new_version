import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/widgets/custom_text_form_field.dart';
import 'package:fada_alhalij_web/core/widgets/get_location.dart';
import 'package:fada_alhalij_web/features/address/presentation/blocs/areas/areas_cubit.dart';
import 'package:fada_alhalij_web/features/address/presentation/widgets/drop_down_delivery_areas.dart';
import 'package:fada_alhalij_web/features/cart/presentation/cubit/address/address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:geolocator_web/geolocator_web.dart';

// class AddAddress extends StatelessWidget {
//   const AddAddress({super.key, required this.viewModel});
//
//   final AddressCubit viewModel;
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: ColorManager.primaryColor.withAlpha(50),
//               borderRadius: BorderRadius.circular(25),
//             ),
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 CustomElevatedButton(
//                   buttonColor: ColorManager.blue,
//                   onPressed: () {
//                     getLocation(viewModel);
//                   },
//                   title: "اضغط للحصول على الموقع",
//                 ),
//                 TextFormField(
//                   controller: viewModel.titleController,
//                   decoration: const InputDecoration(labelText: "اسم العنوان"),
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   controller: viewModel.cityController,
//                   decoration: const InputDecoration(labelText: "المدينة"),
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   controller: viewModel.streetController,
//                   decoration: const InputDecoration(labelText: "الشارع"),
//                 ),
//                 const SizedBox(height: 10),
//                 TextFormField(
//                   controller: viewModel.detailsController,
//                   decoration: const InputDecoration(labelText: "تفاصيل"),
//                 ),
//                 const SizedBox(height: 20),
//
//                 CustomElevatedButton(
//                   buttonColor: ColorManager.green,
//                   title: "حفظ العنوان",
//                   onPressed: () async {
//                     await viewModel.addAddress().then(
//                       (value) => viewModel.getAddress(),
//                     );
//                     if (context.mounted) {
//                       Navigator.of(context, rootNavigator: true).pop();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: -10,
//             right: 10,
//             child: CircleAvatar(
//               backgroundColor: ColorManager.primaryColor,
//               child: IconButton(
//                 onPressed: () {
//                   Navigator.of(context, rootNavigator: true).pop();
//                 },
//                 icon: Icon(Icons.close, color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class AddAddress extends StatefulWidget {
  const AddAddress({super.key, required this.viewModel});

  final AddressCubit viewModel;

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.viewModel,
      child: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: widget.viewModel.formKeyAddAddress,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        controller: widget.viewModel.titleController,
                        labelText: "مسمى العنوان",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'من فضلك ادخل المسمى';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),

                      DropDownDeliveryAreas(),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                        controller: widget.viewModel.streetController,
                        labelText: "الشارع",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'من فضلك ادخل الشارع';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                        controller: widget.viewModel.detailsController,
                        labelText: "تفاصيل",
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'من فضلك ادخل التفاصيل';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Checkbox(
                            value: isAccepted,
                            onChanged: (value) {
                              setState(() {
                                isAccepted = !isAccepted;
                              });
                            },
                            checkColor: Colors.white,
                            activeColor: ColorManager.primaryColor,
                            side: BorderSide(
                              color: ColorManager.primaryColor,
                              width: 2, // عرض الإطار
                            ),
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'استخدم الموقع الحالي',
                                    style: getSemiBoldStyle(
                                      color: ColorManager.primaryColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          isAccepted
                              ? ColorManager.primaryColor
                              : Colors.grey,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          FocusManager.instance.primaryFocus?.unfocus();


                          if (!widget.viewModel.formKeyAddAddress.currentState!
                              .validate()) return;

                          // if (!context.read<AreasCubit>().formKeyAreas.currentState!.validate()) return;

                          if (!isAccepted) return;


                          await getLocation(widget.viewModel);
                          await widget.viewModel.addAddress();
                          await widget.viewModel.getAddress();

                          // أغلق الشاشة إذا لا يزال السياق صالحًا
                          if (context.mounted) {
                            Navigator.of(context, rootNavigator: true).pop();
                          }
                        },

                        child: const Text(
                          "حفظ العنوان",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -20,
                right: 20,
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.red,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    icon: const Icon(Icons.close, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
