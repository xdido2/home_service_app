import 'package:flutter/material.dart';
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
                  AuthInputEmailPassword(),
                  AuthInputPhoneNumber(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SignInPageBodyInput extends StatelessWidget {
  const SignInPageBodyInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
