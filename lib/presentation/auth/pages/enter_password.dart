import 'package:e_commerce/common/bloc/button/button_state_cubit.dart';
import 'package:e_commerce/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce/common/widgets/appbar/app_bar.dart';
import 'package:e_commerce/common/widgets/button/basic_reactive_button.dart';
import 'package:e_commerce/data/auth/models/user_signin_req.dart';
import 'package:e_commerce/domain/auth/usecases/signin.dart';
import 'package:e_commerce/presentation/auth/pages/forgot_password.dart';
import 'package:e_commerce/presentation/home/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/bloc/button/button_state.dart';

class EnterPasswordPage extends StatefulWidget {
  final UserSigninReq signinReq;
  const EnterPasswordPage({required this.signinReq, super.key});

  @override
  State<EnterPasswordPage> createState() => _EnterPasswordPageState();
}

class _EnterPasswordPageState extends State<EnterPasswordPage> {
  final TextEditingController _passwordCon = TextEditingController();

  @override
  void dispose() {
    _passwordCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonFailureState) {
                var snackbar = SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }

              if (state is ButtonSuccessState) {
                AppNavigator.pushAndRemove(context, const HomePage());
              }
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _siginText(context),
                  SizedBox(height: 20.h),
                  _passwordField(context),
                  SizedBox(height: 20.h),
                  _continueButton(context),
                  SizedBox(height: 20.h),
                  _forgotPassword(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _siginText(BuildContext context) {
    return Text(
      'Sign in',
      style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(hintText: 'Enter Password'),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            widget.signinReq.password = _passwordCon.text;
            context.read<ButtonStateCubit>().execute(
              usecase: SigninUseCase(),
              params: widget.signinReq,
            );
          },
          title: 'Continue',
        );
      },
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Forgot password? "),
          TextSpan(
            text: 'Reset',
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.push(context, ForgotPasswordPage());
                  },
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
