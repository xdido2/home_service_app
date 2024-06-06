import 'package:flutter/material.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';

Widget popUpModalBtn(
  BuildContext context,
  String title,
  Color color,
  String path,
  Function func,
  String chooseDateTime,
) {
  return ElevatedButton(
    onPressed: () => func(),
    style: ButtonStyle(
      padding: const WidgetStatePropertyAll(EdgeInsets.all(16)),
      backgroundColor: WidgetStatePropertyAll(color),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageIcon(
          AssetImage(path),
          size: 24,
          color: AppColors.productDetailPopUpModalChooseBtnIconColor,
        ),
        const SizedBox(
          width: 14,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyle.productDetailChooseBtnTitleTextStyle,
            ),
            Text(
              chooseDateTime,
              style: AppTextStyle.productDetailChooseBtnSubtitleTextStyle,
            ),
          ],
        ),
      ],
    ),
  );
}
