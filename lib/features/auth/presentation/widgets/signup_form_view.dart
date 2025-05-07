import 'package:fada_alhalij_web/core/widgets/custom_elevated_button.dart';
import 'package:fada_alhalij_web/core/widgets/custom_text_form_field.dart';
import 'package:fada_alhalij_web/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key, required this.viewModel});

  final AuthCubit viewModel;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _obscureRePassword = true;



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          CustomTextFormField(
            controller: widget.viewModel.nameController,
            labelText: "الاسم",
          ),
          CustomTextFormField(
            controller: widget.viewModel.emailController,
            labelText: "الايميل",
            keyboardType: TextInputType.emailAddress,
          ),
          Focus(
            onFocusChange: (hasFocus) {
              if (hasFocus && widget.viewModel.phoneController.text.isEmpty) {
                widget.viewModel.phoneController.text = '+966';
              }
            },
            child: CustomTextFormField(
              controller: widget.viewModel.phoneController,
              labelText: "جوال",
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                if (value.startsWith("+9660")) {
                  widget.viewModel.phoneController.text =  "+966${value.substring(5)}" ; // إزالة الصفر الأول
                  widget.viewModel.phoneController.selection = TextSelection.fromPosition(
                    TextPosition(offset: widget.viewModel.phoneController.text.length),
                  ); // تحديث مؤشر الكتابة
                }
              },
              validator: (value) {
                if (value == null || value.isEmpty || value == '+966') {
                  return 'رقم الجوال مطلوب';
                }
                if (!value.startsWith('+966')) {
                  return 'رقم الهاتف يجب أن يبدأ بـ +966';
                }
                if (value.length != 13) {
                  return 'رقم الهاتف يجب أن يحتوي على 12 رقمًا ';
                }
                return null;
              },
            ),
          ),
          CustomTextFormField(
            controller: widget.viewModel.passwordController,
            labelText: "كلمة المرور",
            hintText: "ادخل كلمة المرور",
            isPassword: true,
            obscureText: _obscurePassword,
            onToggle: () {
              setState(() => _obscurePassword = !_obscurePassword);
            },
            validator: (value) {
              if (value == null || value.length < 6) {
                return 'كلمة المرور قصيرة';
              }
              return null;
            },
          ),
          CustomTextFormField(
            controller: widget.viewModel.rePasswordController,
            labelText: "تأكيد كلمة المرور",
            hintText: "تاكيد كلمة المرور",
            isPassword: true,
            obscureText: _obscureRePassword,
            onToggle: () {
              setState(() => _obscureRePassword = !_obscureRePassword);
            },
            validator: (value) {
              if (value != widget.viewModel.passwordController.text) {
                return 'كلمة المرور غير متطابقة';
              }
              return null;
            },
          ),
          CustomElevatedButton(
            onPressed: _submit,
            buttonColor: ColorManager.orange,
            title: 'تسجيل جديد',
          ),

        ],
      ),
    );
  }
  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.viewModel.signUp();
    }
  }
}
