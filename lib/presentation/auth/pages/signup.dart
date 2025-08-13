import 'package:e_commerce/common/helper/navigator/app_navigator.dart';
import 'package:e_commerce/common/widgets/appbar/app_bar.dart';
import 'package:e_commerce/common/widgets/button/basic_app_button.dart';
import 'package:e_commerce/data/auth/models/user_creation_req.dart';
import 'package:e_commerce/presentation/auth/pages/gender_and_age_selection.dart';
import 'package:e_commerce/presentation/auth/pages/siginin.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _firstNameCon = TextEditingController();

  final TextEditingController _lastNameCon = TextEditingController();

  final TextEditingController _emailCon = TextEditingController();

  final TextEditingController _passwordCon = TextEditingController();
  @override
void dispose() {
  _firstNameCon.dispose();
  _lastNameCon.dispose();
  _emailCon.dispose();
  _passwordCon.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: SingleChildScrollView(
        padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _siginText(),
            SizedBox(height: 20.h),
            _firstNameField(),
            SizedBox(height: 20.h),
            _lastNameField(),
            SizedBox(height: 20.h),
            _emailField(),
            SizedBox(height: 20.h),
            _passwordField(context),
            SizedBox(height: 20.h),
            _continueButton(context),
            SizedBox(height: 20.h),
            _createAccount(context),
          ],
        ),
      ),
    );
  }

  Widget _siginText() {
    return  Text(
      'Create Account',
      style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
    );
  }

  Widget _firstNameField() {
    return TextField(
      controller: _firstNameCon,
      decoration: const InputDecoration(hintText: 'Firstname'),
    );
  }

  Widget _lastNameField() {
    return TextField(
      controller: _lastNameCon,
      decoration: const InputDecoration(hintText: 'Lastname'),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(hintText: 'Email Address'),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          GenderAndAgeSelectionPage(
            userCreationReq: UserCreationReq(
              firstName: _firstNameCon.text.trim(),
              email: _emailCon.text.trim(),
              lastName: _lastNameCon.text.trim(),
              password: _passwordCon.text.trim(),
            ),
          ),
        );
      },
      title: 'Continue',
    );
  }

  Widget _createAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(text: "Do you have an account? "),
          TextSpan(
            text: 'Signin',
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.pushReplacement(context, SigninPage());
                  },
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

