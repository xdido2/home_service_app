import 'package:flutter/material.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';

class AuthInputPhoneNumber extends StatefulWidget {
  const AuthInputPhoneNumber({super.key});

  @override
  State<AuthInputPhoneNumber> createState() => _AuthInputState();
}

class _AuthInputState extends State<AuthInputPhoneNumber> {
  String _selectedCountryCode = '+998';
  final List<Map<String, String>> _countryCodes = [
    {
      'code': 'RU',
      'dial_code': '+7',
      'flag': 'assets/images/flags/russia.png',
    },
    {
      'code': 'UZ',
      'dial_code': '+998',
      'flag': 'assets/images/flags/uzbekistan.png'
    },
    // Add more countries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number',
          style: AppTextStyle.authInputTitleTextStyle,
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: AppColors.secondaryColor,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedCountryCode,
                    items: _countryCodes.map((country) {
                      return DropdownMenuItem<String>(
                        value: country['dial_code'],
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: Image.asset(
                                country['flag']!,
                                width: 24,
                                height: 24,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              country['dial_code']!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCountryCode = value!;
                      });
                    },
                  ),
                ),
              ),
              const VerticalDivider(
                color: Colors.white,
                thickness: 1,
                width: 10,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12),
                    border: InputBorder.none,
                    hintText: 'Phone Number',
                    hintStyle: AppTextStyle.authInputTitleTextStyle.copyWith(
                      fontSize: 14,
                      color: AppColors.hintTextColor,
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  style: AppTextStyle.authInputTitleTextStyle.copyWith(
                    fontSize: 14,
                    color: AppColors.authHintTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AuthInputEmailPassword extends StatelessWidget {
  const AuthInputEmailPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Phone Number',
          style: AppTextStyle.authInputTitleTextStyle,
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            border: InputBorder.none,
            hintText: 'Phone Number',
            hintStyle: AppTextStyle.authInputTitleTextStyle.copyWith(
              fontSize: 14,
              color: AppColors.hintTextColor,
            ),
          ),
          keyboardType: TextInputType.phone,
          style: AppTextStyle.authInputTitleTextStyle.copyWith(
            fontSize: 14,
            color: AppColors.authHintTextColor,
          ),
        ),
      ],
    );
  }
}
