import 'package:flutter/material.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';

Widget textFieldWidget(BuildContext context, String title, bool hasBack) => TextField(
      style: AppTextStyle.textFieldTextStyle,
      decoration: InputDecoration(
        hintText: title,
        hintStyle: AppTextStyle.textFieldTextStyle,
        suffixIconConstraints: const BoxConstraints(
          minHeight: 32,
          minWidth: 32,
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            backgroundColor:
                const WidgetStatePropertyAll<Color>(AppColors.thirdColor),
          ),
          color: AppColors.activeIconColor,
          icon: const ImageIcon(
            AssetImage('assets/images/icons/app_icons/search_icon.png'),
            size: 14.3,
          ),
        ),

         prefixIcon: hasBack == true ?  IconButton(
          onPressed: () => Navigator.pop(context),
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          color: AppColors.activeIconColor,
            icon:  const BackButtonIcon()
        ) : null,
        contentPadding: const EdgeInsets.only(
          top: 9,
          bottom: 9,
          left: 13,
          right: 15,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.textFieldBorderColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
