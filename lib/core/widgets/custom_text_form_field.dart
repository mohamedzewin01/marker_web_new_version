import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';
import '../resources/theme_manager.dart';
import '../resources/values_manager.dart';

// class CustomTextFormField extends StatelessWidget {
//   const CustomTextFormField({
//     super.key,
//     required this.controller,
//     this.labelText,
//     this.hintText,
//     this.obscureText,
//     this.validator,
//     this.suffix,
//     this.keyboardType,
//     this.enabled,
//     this.prefixIcon,
//     this.initialValue,
//     this.onChanged, this.inputAction,
//   });
//
//   final TextEditingController controller;
//   final String? labelText;
//   final String? hintText;
//   final String? initialValue;
//   final bool? obscureText;
//   final bool? enabled;
//   final String? Function(String?)? validator;
//   final Widget? suffix;
//   final Widget? prefixIcon;
//   final TextInputType? keyboardType;
//   final TextInputAction? inputAction;
//   final void Function(String)? onChanged;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: AppSize.s45,
//       child: TextFormField(
//         textInputAction:inputAction ,
//         cursorColor: ColorManager.placeHolderColor,
//         style: const TextStyle(color: ColorManager.placeHolderColor),
//         initialValue: initialValue,
//         readOnly: enabled ?? false,
//         controller: controller,
//         keyboardType: keyboardType,
//         decoration: InputDecoration(
//           prefixIcon: prefixIcon,
//           prefixIconColor: ColorManager.placeHolderColor,
//           suffixIcon: suffix != null
//               ? Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     suffix!,
//                   ],
//                 )
//               : null,
//           suffixIconColor: ColorManager.placeHolderColor,
//           labelText: labelText,
//           labelStyle: getRegularStyle(
//             color: ColorManager.placeHolderColor,
//             fontSize: FontSize.s16,
//           ),
//           hintText: hintText,
//           hintStyle: getRegularStyle(
//             color: ColorManager.placeHolderColor,
//             fontSize: FontSize.s14,
//           ),
//           errorStyle:TextStyle(fontSize: 10, height: 0) ,/// error style
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           contentPadding: const EdgeInsets.all(AppPadding.p18),
//           enabledBorder: outLintInputBorderMethod(
//             const BorderSide(color: ColorManager.placeHolderColor, width: AppSize.w1_5),
//             const BorderRadius.all(Radius.circular(AppSize.s20)),
//           ),
//           focusedBorder: outLintInputBorderMethod(
//             const BorderSide(color: ColorManager.placeHolderColor, width: AppSize.w1_5),
//             const BorderRadius.all(Radius.circular(AppSize.s20)),
//           ),
//           errorBorder: outLintInputBorderMethod(
//             const BorderSide(color: ColorManager.error, width: AppSize.w1_5),
//             const BorderRadius.all(Radius.circular(AppSize.s20)),
//           ),
//           focusedErrorBorder: outLintInputBorderMethod(
//             const BorderSide(color: ColorManager.error, width: AppSize.w1_5),
//             const BorderRadius.all(Radius.circular(AppSize.s20)),
//           ),
//           disabledBorder: outLintInputBorderMethod(
//             const BorderSide(color: ColorManager.placeHolderColor, width: AppSize.w1_5),
//             const BorderRadius.all(Radius.circular(AppSize.s20)),
//           ),
//         ),
//         obscureText: obscureText ?? false,
//         validator: validator,
//         onChanged: onChanged,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//       ),
//     );
//   }
// }
class CustomTextFormFieldRegister extends StatelessWidget {
  const CustomTextFormFieldRegister({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.obscureText,
    this.validator,
    this.keyboardType,
    this.enabled,
    this.prefixIcon,
    this.initialValue,
    this.onChanged,
    this.onTap,
    this.onChangeRadio,
    this.groupValue,
    this.value,
    this.suffix,
  });

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final bool? obscureText;
  final bool? enabled;
  final String? Function(String?)? validator;

  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(int?)? onChangeRadio;
  final int? groupValue;
  final int? value;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.s45,
      child: TextFormField(
        cursorColor: ColorManager.placeHolderColor,
        style: const TextStyle(color: ColorManager.placeHolderColor),
        initialValue: initialValue,
        readOnly: enabled ?? false,
        onTap: onTap,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          fillColor: ColorManager.placeHolderColor.withAlpha(100),
          filled: true,
          prefixIconColor: ColorManager.white,
          suffixIcon: Radio(
            value: value!,
            groupValue: groupValue,
            fillColor: WidgetStateProperty.all(ColorManager.white),
            onChanged: onChangeRadio,
          ),
          suffixIconColor: ColorManager.placeHolderColor,
          labelText: labelText,
          labelStyle: getRegularStyle(
            color: ColorManager.placeHolderColor,
            fontSize: FontSize.s16,
          ),
          hintText: hintText,
          hintStyle: getSemiBoldStyle(
            color: ColorManager.white,
            fontSize: FontSize.s14,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.all(AppPadding.p18),
          enabledBorder: outLintInputBorderMethod(
            const BorderSide(
              color: ColorManager.placeHolderColor,
              width: AppSize.w1_5,
            ),
            const BorderRadius.all(Radius.circular(AppSize.s20)),
          ),
          focusedBorder: outLintInputBorderMethod(
            const BorderSide(
              color: ColorManager.placeHolderColor,
              width: AppSize.w1_5,
            ),
            const BorderRadius.all(Radius.circular(AppSize.s20)),
          ),
          errorBorder: outLintInputBorderMethod(
            const BorderSide(color: ColorManager.error, width: AppSize.w1_5),
            const BorderRadius.all(Radius.circular(AppSize.s20)),
          ),
          focusedErrorBorder: outLintInputBorderMethod(
            const BorderSide(color: ColorManager.error, width: AppSize.w1_5),
            const BorderRadius.all(Radius.circular(AppSize.s20)),
          ),
          disabledBorder: outLintInputBorderMethod(
            const BorderSide(
              color: ColorManager.placeHolderColor,
              width: AppSize.w1_5,
            ),
            const BorderRadius.all(Radius.circular(AppSize.s20)),
          ),
        ),
        obscureText: obscureText ?? false,
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
//
// class CustomTextFormField extends StatelessWidget {
//   const CustomTextFormField({
//     super.key,
//     required this.controller,
//     this.labelText,
//     this.hintText,
//     this.obscureText,
//     this.validator,
//     this.suffix,
//     this.keyboardType,
//     this.enabled,
//     this.prefixIcon,
//     this.initialValue,
//     this.onChanged,
//     this.inputAction, this.onTap,
//   });
//
//   final TextEditingController controller;
//   final String? labelText;
//   final String? hintText;
//   final String? initialValue;
//   final bool? obscureText;
//   final bool? enabled;
//   final String? Function(String?)? validator;
//   final Widget? suffix;
//   final Widget? prefixIcon;
//   final TextInputType? keyboardType;
//   final TextInputAction? inputAction;
//   final void Function(String)? onChanged;
//   final void Function()? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       onTap:onTap ,
//       cursorColor: ColorManager.placeHolderColor,
//       style: getSemiBoldStyle(color: ColorManager.primaryColor,fontSize: 16),
//       initialValue: initialValue,
//       textDirection: TextDirection.rtl,
//       inputFormatters: [
//         FilteringTextInputFormatter.allow(RegExp('[\u0600-\u06FF0-9\s]')),       ],
//       readOnly: enabled ?? false,
//       controller: controller,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         errorStyle: TextStyle(fontSize: 14),
//         prefixIcon: prefixIcon,
//         prefixIconColor: ColorManager.placeHolderColor,
//         suffixIcon: suffix != null
//             ? Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   suffix!,
//                 ],
//               )
//             : null,
//         suffixIconColor: ColorManager.placeHolderColor,
//         labelText: labelText,
//         labelStyle: getRegularStyle(
//           color: ColorManager.placeHolderColor,
//           fontSize: FontSize.s16,
//         ),
//         hintText: hintText,
//         hintStyle: getRegularStyle(
//           color: ColorManager.placeHolderColor2,
//           fontSize: FontSize.s14,
//         ),
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p14, vertical:   AppPadding.p8),
//         enabledBorder: outLintInputBorderMethod(
//           const BorderSide(
//               color: ColorManager.placeHolderColor, width: AppSize.w1_5),
//           const BorderRadius.all(Radius.circular(AppSize.s40)),
//         ),
//         focusedBorder: outLintInputBorderMethod(
//           const BorderSide(
//               color: ColorManager.primaryColor, width: AppSize.w1_5),
//           const BorderRadius.all(Radius.circular(AppSize.s40)),
//         ),
//         errorBorder: outLintInputBorderMethod(
//           const BorderSide(
//               color: ColorManager.primaryColor, width: AppSize.w1_5),
//           const BorderRadius.all(Radius.circular(AppSize.s40)),
//         ),
//         focusedErrorBorder: outLintInputBorderMethod(
//           const BorderSide(
//               color: ColorManager.primaryColor, width: AppSize.w1_5),
//           const BorderRadius.all(Radius.circular(AppSize.s40)),
//         ),
//         disabledBorder: outLintInputBorderMethod(
//             const BorderSide(
//                 color: ColorManager.placeHolderColor, width: AppSize.w1_5),
//             const BorderRadius.all(Radius.circular(AppSize.s40))),
//       ),
//       obscureText: obscureText ?? false,
//       validator: validator,
//       onChanged: onChanged,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//     );
//   }
// }
// class CustomTextFormField extends StatelessWidget {
//   const CustomTextFormField({
//     super.key,
//     required this.controller,
//     this.labelText,
//     this.hintText,
//     this.obscureText,
//     this.validator,
//     this.suffix,
//     this.keyboardType,
//     this.enabled,
//     this.prefixIcon,
//     this.initialValue,
//     this.onChanged,
//     this.inputAction, this.onTap,
//   });
//
//   final TextEditingController controller;
//   final String? labelText;
//   final String? hintText;
//   final String? initialValue;
//   final bool? obscureText;
//   final bool? enabled;
//   final String? Function(String?)? validator;
//   final Widget? suffix;
//   final Widget? prefixIcon;
//   final TextInputType? keyboardType;
//   final TextInputAction? inputAction;
//   final void Function(String)? onChanged;
//   final void Function()? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       onTap:onTap ,
//       cursorColor: ColorManager.placeHolderColor,
//       style: getSemiBoldStyle(color: ColorManager.primaryColor,fontSize: 16),
//       initialValue: initialValue,
//       readOnly: enabled ?? false,
//       controller: controller,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         errorStyle: TextStyle(fontSize: 14),
//         prefixIcon: prefixIcon,
//         prefixIconColor: ColorManager.placeHolderColor,
//         suffixIcon: suffix != null
//             ? Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             suffix!,
//           ],
//         )
//             : null,
//         suffixIconColor: ColorManager.placeHolderColor,
//         labelText: labelText,
//         labelStyle: getRegularStyle(
//           color: ColorManager.placeHolderColor,
//           fontSize: FontSize.s16,
//         ),
//         hintText: hintText,
//         hintStyle: getRegularStyle(
//           color: ColorManager.placeHolderColor2,
//           fontSize: FontSize.s14,
//         ),
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p14, vertical:   AppPadding.p8),
//         enabledBorder: outLintInputBorderMethod(
//           const BorderSide(
//               color: ColorManager.placeHolderColor, width: AppSize.w1_5),
//           const BorderRadius.all(Radius.circular(AppSize.s40)),
//         ),
//         focusedBorder: outLintInputBorderMethod(
//           const BorderSide(
//               color: ColorManager.primaryColor, width: AppSize.w1_5),
//           const BorderRadius.all(Radius.circular(AppSize.s40)),
//         ),
//         errorBorder: outLintInputBorderMethod(
//           const BorderSide(
//               color: ColorManager.primaryColor, width: AppSize.w1_5),
//           const BorderRadius.all(Radius.circular(AppSize.s40)),
//         ),
//         focusedErrorBorder: outLintInputBorderMethod(
//           const BorderSide(
//               color: ColorManager.primaryColor, width: AppSize.w1_5),
//           const BorderRadius.all(Radius.circular(AppSize.s40)),
//         ),
//         disabledBorder: outLintInputBorderMethod(
//             const BorderSide(
//                 color: ColorManager.placeHolderColor, width: AppSize.w1_5),
//             const BorderRadius.all(Radius.circular(AppSize.s40))),
//       ),
//       obscureText: obscureText ?? false,
//       validator: validator,
//       onChanged: onChanged,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//     );
//   }
// }

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.validator,
    this.suffix,
    this.keyboardType,
    this.enabled,
    this.prefixIcon,
    this.onChanged,
    this.inputAction,
    this.onTap,
    this.onToggle,
    this.isPassword = false,
    this.onFieldSubmitted,
    this.maxLines, this.textDirection,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final int? maxLines;
  final bool? obscureText;
  final bool? isPassword;
  final VoidCallback? onToggle;
  final bool? enabled;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final TextDirection? textDirection;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      maxLines: maxLines ?? 1,
      controller: controller,
      cursorColor: ColorManager.placeHolderColor,
      style: getSemiBoldStyle(color: ColorManager.primaryColor, fontSize: 16),
      keyboardType: keyboardType,
      textInputAction: inputAction,
      textDirection: textDirection??TextDirection.rtl,
      readOnly: enabled ?? false,
      obscureText: obscureText ?? false,
      validator: validator,
      onChanged: onChanged,

      autovalidateMode: AutovalidateMode.onUserInteraction,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        errorStyle: const TextStyle(fontSize: 14),
        prefixIcon: prefixIcon,
        prefixIconColor: ColorManager.placeHolderColor,
        suffixIcon:
            isPassword == true
                ? IconButton(
                  icon: Icon(
                    obscureText! ? Icons.visibility : Icons.visibility_off,
                    color: ColorManager.primaryColor,
                  ),
                  onPressed: onToggle,
                )
                : suffix,
        suffixIconColor: ColorManager.cyanDark,
        labelText: labelText,
        labelStyle: getRegularStyle(
          color: ColorManager.black,
          fontSize: FontSize.s16,
        ),
        hintText: hintText,
        hintStyle: getRegularStyle(
          color: ColorManager.black.withAlpha(150),
          fontSize: FontSize.s14,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p18,
          vertical: AppPadding.p18,
        ),
        enabledBorder: outLintInputBorderMethod(
          BorderSide(
            color: ColorManager.primaryColor.withAlpha(150),
            width: AppSize.w1_5,
          ),
          const BorderRadius.all(Radius.circular(AppSize.s10)),
        ),
        focusedBorder: outLintInputBorderMethod(
          const BorderSide(
            color: ColorManager.primaryColor,
            width: AppSize.w1_5,
          ),
          const BorderRadius.all(Radius.circular(AppSize.s10)),
        ),
        errorBorder: outLintInputBorderMethod(
          const BorderSide(
            color: ColorManager.primaryColor,
            width: AppSize.w1_5,
          ),
          const BorderRadius.all(Radius.circular(AppSize.s10)),
        ),
        focusedErrorBorder: outLintInputBorderMethod(
          const BorderSide(
            color: ColorManager.primaryColor,
            width: AppSize.w1_5,
          ),
          const BorderRadius.all(Radius.circular(AppSize.s10)),
        ),
        disabledBorder: outLintInputBorderMethod(
          const BorderSide(
            color: ColorManager.placeHolderColor,
            width: AppSize.w1_5,
          ),
          const BorderRadius.all(Radius.circular(AppSize.s10)),
        ),
      ),
    );
  }
}
