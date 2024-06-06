import 'package:flutter/material.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';

Widget pageDetailBtn(BuildContext context, String type, Function func) => ElevatedButton(
      onPressed: () => func(),
      style: ButtonStyle(
        backgroundColor: type == 'Save Draft'
            ? const WidgetStatePropertyAll(AppColors.secondaryColor)
            : const WidgetStatePropertyAll(AppColors.thirdColor),
        fixedSize: const WidgetStatePropertyAll(Size(168, 48)),
        shape: type == 'Save Draft'
            ? WidgetStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(
                    width: 2,
                    color: AppColors.productDetailBtnBorderColor,
                  ),
                ),
              )
            : WidgetStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
      ),
      child: Text(
        type,
        style: AppTextStyle.productDetailBtnTextStyle,
      ),
    );
