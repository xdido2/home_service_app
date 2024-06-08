import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/ui/router/app_routes.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';
import 'package:home_service_app/ui/widget/auth_input.dart';

class SingInPage extends StatelessWidget {
  const SingInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInPageBody(),
    );
  }
}

class SignInPageBody extends StatelessWidget {
  const SignInPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/app_logo.png',
                  height: 66,
                  width: 65,
                ),
                Text(
                  'Door Hub',
                  style: AppTextStyle.appLogoTextStyle,
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign in',
                    style: AppTextStyle.authTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const AuthInputPhoneNumber(
                    type: 'phone',
                    title: 'Phone Number',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SignButton(
                    title: 'Sign In',
                  ),
                ],
              ),
            ),
            const OtherWay(),
            RichText(
              text: TextSpan(
                text: 'Create a New Account? ',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(154, 159, 165, 1),
                  fontFamily: 'Inter',
                ),
                children: [
                  TextSpan(
                    text: 'SignUp',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pushNamed(
                            context,
                            AppRoutes.signUp,
                          ),
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

class OtherWay extends StatelessWidget {
  const OtherWay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 67, left: 67),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sign in with',
            style: AppTextStyle.authOtherWayBtnTitleTextStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OtherWayBtn(
                imagePath: 'assets/images/company_logos/google_logo.png',
              ),
              OtherWayBtn(
                imagePath: 'assets/images/company_logos/facebook_logo.png',
              ),
              OtherWayBtn(
                imagePath: 'assets/images/company_logos/apple_logo.png',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class OtherWayBtn extends StatelessWidget {
  final String imagePath;

  const OtherWayBtn({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.authBtnColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.authHintTextColor,
          width: 2,
        ),
      ),
      child: Image.asset(
        imagePath,
      ),
    );
  }
}
