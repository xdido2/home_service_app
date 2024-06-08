import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/ui/router/app_routes.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';
import 'package:home_service_app/ui/widget/auth_input.dart';

class SingUpPage extends StatelessWidget {
  const SingUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpPageBody(),
    );
  }
}

class SignUpPageBody extends StatelessWidget {
  const SignUpPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 81, bottom: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/app_logo.png',
              height: 66,
              width: 65,
            ),
            const SizedBox(
              height: 57,
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign Up',
                    style: AppTextStyle.authTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const AuthInputPhoneNumber(
                    type: 'gender',
                    title: 'First Name',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const AuthInputEmailPassword(
                    title: 'Last Name',
                    type: 'text',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const AuthInputPhoneNumber(
                    title: 'Phone Number',
                    type: 'phone',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const AuthInputEmailPassword(
                    title: 'Email',
                    type: 'other',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const SignButton(
              title: 'Sign In',
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                text: 'Already have an Account? ',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(154, 159, 165, 1),
                  fontFamily: 'Inter',
                ),
                children: [
                  TextSpan(
                    text: 'Sign in',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.signIn, (route) => false),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      color: AppColors.thirdColor,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
