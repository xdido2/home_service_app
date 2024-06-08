import 'package:flutter/material.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';

class AuthInputPhoneNumber extends StatefulWidget {
  final String type;
  final String title;

  const AuthInputPhoneNumber(
      {super.key, required this.type, required this.title});

  @override
  State<AuthInputPhoneNumber> createState() => _AuthInputState();
}

class _AuthInputState extends State<AuthInputPhoneNumber> {
  String _selectedCountryCode = '+998';
  final List<Map<String, String>> _countryCodes = [
    {
      'code': 'UZB',
      'dial_code': '+998',
      'flag': 'assets/images/flags/uzbekistan.png'
    },
    {
      'code': 'RU',
      'dial_code': '+7',
      'flag': 'assets/images/flags/russia.png'
    },
    // Add more countries as needed
  ];

  String _selectedGender = 'Mr.';
  final List<String> _genders = ['Mr.', 'Ms.', 'Mrs.', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.only(right: 12, left: 12),
          child: Row(
            children: [
              if (widget.type == 'phone')
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedCountryCode,
                    items: _countryCodes.map((country) {
                      return DropdownMenuItem<String>(
                        value: country['dial_code'],
                        child: Row(
                          children: [
                            Image.asset(
                              country['flag']!,
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(width: 8),
                            Text(country['dial_code']!,
                                style: AppTextStyle.authInputTitleTextStyle),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCountryCode = value!;
                      });
                    },
                    dropdownColor: AppColors.secondaryColor,
                    icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                    style: AppTextStyle.authInputTitleTextStyle,
                  ),
                ),
              if (widget.type == 'gender')
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedGender,
                    items: _genders.map((gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(
                          gender,
                          style: AppTextStyle.authInputTitleTextStyle
                              .copyWith(fontSize: 14),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                    dropdownColor: AppColors.secondaryColor,
                    icon:
                        const Icon(Icons.arrow_drop_down, color: Colors.white),
                    style: AppTextStyle.authInputTitleTextStyle,
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
                    hintText:
                        widget.type == 'phone' ? 'Phone Number' : 'First Name',
                    hintStyle: AppTextStyle.authInputTitleTextStyle
                        .copyWith(color: AppColors.authHintTextColor),
                    border: InputBorder.none,
                  ),
                  keyboardType: widget.type == 'phone'
                      ? TextInputType.phone
                      : TextInputType.text,
                  style: AppTextStyle.authInputTitleTextStyle,
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
  final String title;
  final String type;

  const AuthInputEmailPassword(
      {super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.authInputTitleTextStyle,
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.secondaryColor,
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            hintText: title,
            hintStyle: AppTextStyle.authInputTitleTextStyle.copyWith(
              fontSize: 14,
              color: AppColors.hintTextColor,
            ),
          ),
          keyboardType: type == 'other'
              ? title == 'Email'
                  ? TextInputType.emailAddress
                  : TextInputType.visiblePassword
              : TextInputType.text,
          style: AppTextStyle.authInputTitleTextStyle.copyWith(
            fontSize: 14,
            color: AppColors.authHintTextColor,
          ),
        ),
      ],
    );
  }
}

class SignButton extends StatelessWidget {
  final String title;

  const SignButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(AppColors.authBtnColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 48)),
      ),
      child: Text(
        title,
        style: AppTextStyle.authSignTitleTextStyle,
      ),
    );
  }
}
