import 'package:flutter/material.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';

Widget categoryItem(
  BuildContext context,
  String title,
  String path,
  Color color,
  bool? isBack,
    bool? isInPage,
) =>
    Column(
      children: [
        Container(
          height: isInPage == true ? 68 : 58,
          width: isInPage == true ? 68 : 58,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isBack == true ? AppColors.rowCategoriesBackBtnBackgroundColor : color,
            border: isBack == true
                ? Border.all(
                    color: AppColors.rowCategoriesBackBtnBorderColor,
                  )
                : null,
          ),
          padding: const EdgeInsets.all(16),
          child: Image(
            color: isBack == true ? AppColors.rowCategoriesBackBtnColor : AppColors.categoryIconColor,
            image: AssetImage(path),
          ),
        ),
        Text(
          title,
          style: AppTextStyle.categoryItemTextStyle,
        )
      ],
    );
