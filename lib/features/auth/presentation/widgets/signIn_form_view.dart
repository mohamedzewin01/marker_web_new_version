import 'package:fada_alhalij_web/core/resources/color_manager.dart';
import 'package:fada_alhalij_web/core/widgets/custom_elevated_button.dart';
import 'package:fada_alhalij_web/core/widgets/custom_text_form_field.dart';
import 'package:fada_alhalij_web/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key, required this.viewModel});
final AuthCubit viewModel;
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;

  void _submit() {
    if (_formKey.currentState!.validate()) {
   widget.viewModel.signIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Focus(
            onFocusChange: (hasFocus) {
              if (hasFocus && widget.viewModel.loginController.text.isEmpty) {
                widget.viewModel.loginController.text = '+966';
              }
            },
            child:CustomTextFormField(
              controller: widget.viewModel.loginController,
              labelText: "رقم الجوال",
              hintText: "5XXXXXXXX",
              keyboardType: TextInputType.phone,
              onTap: () {
                if (!widget.viewModel.loginController.text.startsWith('+966')) {
                  widget.viewModel.loginController.text = '+966';
                  widget.viewModel.loginController.selection = TextSelection.fromPosition(
                    TextPosition(offset: widget.viewModel.loginController.text.length),
                  );
                }
              },
              onChanged: (value) {
                if (!value.startsWith('+966')) {
                  final cleaned = value.replaceAll(RegExp(r'[^\d]'), '');
                  final newText = '+966' + cleaned.replaceFirst(RegExp(r'^966*'), '').replaceFirst(RegExp(r'^0'), '');
                  widget.viewModel.loginController.text = newText;
                  widget.viewModel.loginController.selection = TextSelection.fromPosition(
                    TextPosition(offset: widget.viewModel.loginController.text.length),
                  );
                } else {
                  // لو بعد +966 مباشرة جاء صفر، نحذفه
                  if (value.length > 4 && value[4] == '0') {
                    final newText = value.substring(0, 4) + value.substring(5);
                    widget.viewModel.loginController.text = newText;
                    widget.viewModel.loginController.selection = TextSelection.fromPosition(
                      TextPosition(offset: newText.length),
                    );
                  }
                }

                // الحد الأقصى للطول: +966 + 9 أرقام = 13
                if (widget.viewModel.loginController.text.length > 13) {
                  final text = widget.viewModel.loginController.text.substring(0, 13);
                  widget.viewModel.loginController.text = text;
                  widget.viewModel.loginController.selection = TextSelection.fromPosition(
                    TextPosition(offset: text.length),
                  );
                }
              },

              validator: (value) {
                if (value == null || value.trim().isEmpty || value == '+966') {
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
          SizedBox(height: 12,),
          CustomTextFormField(
            controller:  widget.viewModel.passwordSignInController,
            labelText: "كلمة المرور",
            isPassword: true,
            hintText: "x x x x x x x x ",
            obscureText: _obscurePassword,
            onToggle: () {
              setState(() => _obscurePassword = !_obscurePassword);
            },
            onFieldSubmitted: (value) {
              _submit();
            },
            validator: (value) {
              if (value == null || value.isEmpty) return 'كلمة المرور مطلوبة';
              if (value.length < 6) return 'كلمة المرور قصيرة';
              return null;
            },
            inputAction: TextInputAction.go,
          ),
          CustomElevatedButton(
            onPressed: _submit,
            buttonColor: ColorManager.primaryColor,
            title: 'تسجيل الدخول',
          ),
        ],
      ),
    );
  }
}

