import 'package:fada_alhalij_web/core/di/di.dart';
import 'package:fada_alhalij_web/core/utils/utilss.dart';
import 'package:fada_alhalij_web/core/widgets/custom_dialog.dart';
import 'package:fada_alhalij_web/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fada_alhalij_web/features/auth/presentation/widgets/signIn_form_view.dart';
import 'package:fada_alhalij_web/features/auth/presentation/widgets/signup_form_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthCubit viewModel;
  bool isLogin = true;

  @override
  void initState() {
    viewModel = getIt.get<AuthCubit>();
    super.initState();
  }

  void toggleAuthMode() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSignUpSuccess) {
            CustomDialog.showSuccessDialog(context, message: "تم التسجيل بنجاح");
          }
          if (state is AuthSignUpLoading) {
            CustomDialog.showLoadingDialog(context);
          }
          if (state is AuthSignUpFail) {
            String message = extractErrorMessage(state.exception);
            showDialog(context: context, builder: (context) => Text(message));
          }
          if(state is AuthSignInSuccess){
            CustomDialog.showSuccessDialog(context, message: "تم تسجيل الدخول بنجاح");
          }
          if(state is AuthSignInFail){
            String message = extractErrorMessage(state.exception);
            showDialog(context: context, builder: (context) => Text(message));
          }
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              isLogin
                  ? SignInForm(viewModel: viewModel)
                  : SignupForm(viewModel: viewModel),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isLogin ? "ليس لديك حساب؟" : "لديك حساب؟",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  TextButton(
                    onPressed: toggleAuthMode,
                    child: Text(
                      isLogin ? "سجل الآن" : "تسجيل الدخول",
                      style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

