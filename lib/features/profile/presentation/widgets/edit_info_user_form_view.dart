import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/resources/style_manager.dart';
import 'package:fada_alhalij_web/core/widgets/custom_dialog.dart';
import 'package:fada_alhalij_web/core/widgets/custom_elevated_button.dart';
import 'package:fada_alhalij_web/core/widgets/custom_sliver_app_bar.dart';
import 'package:fada_alhalij_web/core/widgets/custom_text_form_field.dart';
import 'package:fada_alhalij_web/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fada_alhalij_web/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:fada_alhalij_web/features/profile/presentation/cubit/profile_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditInfoUserForm extends StatefulWidget {
  const EditInfoUserForm({super.key});

  @override
  State<EditInfoUserForm> createState() => _EditInfoUserFormState();
}

class _EditInfoUserFormState extends State<EditInfoUserForm> {
  late ProfileCubit viewModel;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel = getIt.get<ProfileCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar(
              title: 'تعديل بيانات المستخدم',
              isBack: true,
              onBackTap: () {

                Navigator.pop(context);
              },
            ),
            BlocListener<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is EditProfileSuccess) {
                  CustomDialog.showSuccessDialog(
                    context,
                    message: 'تم تعديل البيانات بنجاح',
                  );

                }
                // TODO: implement listener
              },
              child: SliverToBoxAdapter(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      spacing: 16.0,
                      children: [
                        Text(
                          ' تعديل البيانات الشخصية',
                          style: getSemiBoldStyle(
                            color: ColorManager.primaryColor,
                            fontSize: 14,
                          ),
                        ),
                        CustomTextFormField(
                          controller: viewModel.editNameController,
                          isRequired: true,
                          labelText: 'الاسم ',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'الاسم مطلوب';
                            }
                            if (value.trim().length < 5) {
                              return 'الاسم يجب أن يكون 5 حروف أو أكثر';
                            }
                            final regex = RegExp(r"^[\u0621-\u064A\s]+$");
                            if (!regex.hasMatch(value.trim())) {
                              return 'الاسم يجب أن يحتوي على حروف عربية فقط';
                            }
                            return null;
                          },
                        ),

                        CustomTextFormField(
                          controller: viewModel.editEmailController,
                          labelText: "الايميل",

                          keyboardType: TextInputType.emailAddress,
                        ),
                        Focus(
                          onFocusChange: (hasFocus) {
                            if (hasFocus &&
                                viewModel.editPhoneController.text.isEmpty) {
                              viewModel.editPhoneController.text = '+966';
                            }
                          },
                          child: CustomTextFormField(
                            controller: viewModel.editPhoneController,
                            isRequired: true,
                            textDirection: TextDirection.ltr,
                            labelText: "رقم الجوال",
                            hintText: "+9665XXXXXXXX",
                            keyboardType: TextInputType.phone,
                            onTap: () {
                              if (!viewModel.editPhoneController.text
                                  .startsWith('+966')) {
                                viewModel.editPhoneController.text = '+966';
                                viewModel
                                    .editPhoneController
                                    .selection = TextSelection.fromPosition(
                                  TextPosition(
                                    offset:
                                        viewModel
                                            .editPhoneController
                                            .text
                                            .length,
                                  ),
                                );
                              }
                            },
                            onChanged: (value) {
                              if (!value.startsWith('+966')) {
                                final cleaned = value.replaceAll(
                                  RegExp(r'[^\d]'),
                                  '',
                                );
                                final newText =
                                    '+966${cleaned.replaceFirst(RegExp(r'^966*'), '').replaceFirst(RegExp(r'^0'), '')}';
                                viewModel.editPhoneController.text = newText;
                                viewModel
                                    .editPhoneController
                                    .selection = TextSelection.fromPosition(
                                  TextPosition(
                                    offset:
                                        viewModel
                                            .editPhoneController
                                            .text
                                            .length,
                                  ),
                                );
                              } else {
                                if (value.length > 4 && value[4] == '0') {
                                  final newText =
                                      value.substring(0, 4) +
                                      value.substring(5);
                                  viewModel.editPhoneController.text = newText;
                                  viewModel
                                      .editPhoneController
                                      .selection = TextSelection.fromPosition(
                                    TextPosition(offset: newText.length),
                                  );
                                }
                              }

                              // الحد الأقصى للطول: +966 + 9 أرقام = 13
                              if (viewModel.editPhoneController.text.length >
                                  13) {
                                final text = viewModel.editPhoneController.text
                                    .substring(0, 13);
                                viewModel.editPhoneController.text = text;
                                viewModel
                                    .editPhoneController
                                    .selection = TextSelection.fromPosition(
                                  TextPosition(offset: text.length),
                                );
                              }
                            },

                            validator: (value) {
                              if (value == null ||
                                  value.trim().isEmpty ||
                                  value == '+966') {
                                return 'رقم الجوال مطلوب';
                              }
                              if (!value.startsWith('+966')) {
                                return 'رقم الهاتف يجب أن يبدأ بـ +966';
                              }
                              if (value.length != 13) {
                                return 'رقم الهاتف يجب أن يحتوي على 9 أرقام بعد +966';
                              }
                              return null;
                            },
                          ),
                        ),

                        CustomElevatedButton(
                          onPressed: _submit,
                          buttonColor: ColorManager.primaryColor,
                          title: 'تعديل',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      viewModel.editProfile();
    }
  }
}

// CustomTextFormField(
// controller: TextEditingController(),
// labelText: "كلمة المرور",
// hintText: "ادخل كلمة المرور",
// textDirection: TextDirection.ltr,
// isPassword: true,
// obscureText: _obscurePassword,
// onToggle: () {
// setState(() => _obscurePassword = !_obscurePassword);
// },
// validator: (value) {
// if (value == null || value.length < 6) {
// return 'كلمة المرور قصيرة';
// }
// return null;
// },
// ),
// CustomTextFormField(
// controller: TextEditingController(),
// labelText: "تأكيد كلمة المرور",
// hintText: "تاكيد كلمة المرور",
// textDirection: TextDirection.ltr,
// isPassword: true,
// obscureText: _obscureRePassword,
// onToggle: () {
// setState(
// () => _obscureRePassword = !_obscureRePassword,
// );
// },
// validator: (value) {
// // if (value != viewModel.passwordController.text) {
// //   return 'كلمة المرور غير متطابقة';
// // }
// // return null;
// },
// ),
