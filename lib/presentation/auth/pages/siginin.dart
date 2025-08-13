
import 'package:e_commerce/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce/common/widgets/appbar/app_bar.dart';
import 'package:e_commerce/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce/data/auth/models/user_signin_req.dart';
import 'package:e_commerce/presentation/auth/pages/enter_password.dart';
import 'package:e_commerce/presentation/auth/pages/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailCon = TextEditingController();

  @override
  void dispose() {
    _emailCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: true,),
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 40.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _siginText(context),
               SizedBox(height: 20.h,),
              _emailField(context),
               SizedBox(height: 20.h,),
              _continueButton(context),
               SizedBox(height: 20.h,),
              _createAccount(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _siginText(BuildContext context) {
    return  Text(
      'Sign in',
      style: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        hintText: 'Enter Email'
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: (){
        AppNavigator.push(
          context, 
          EnterPasswordPage(
            signinReq: UserSigninReq(
              email: _emailCon.text.trim(),
            ),
          )
        );
      },
      title: 'Continue'
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children:  [
          const TextSpan(
            text: "Don't you have an account? "
          ),
           TextSpan(
            text: 'Create one',
            recognizer:TapGestureRecognizer()..onTap = () {
              AppNavigator.push(context,SignupPage());
            } ,
            style: const TextStyle(
              fontWeight: FontWeight.bold
            )
          )
        ]

      ),
    );
  }
}