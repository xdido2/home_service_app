import 'package:flutter/material.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';

Widget serviceItem(
  BuildContext context,
  int discount,
) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Container(
              height: 154,
              width: 139,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: const Image(
                  image: AssetImage('assets/images/service/img.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              height: 21,
              width: 65,
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.discountBackgroundColor,
              ),
              child: Center(
                child: Text(
                  '${discount.toString()}% OFF',
                  style: AppTextStyle.discountTextStyle,
                ),
              ),
            )
          ],
        ),
        Text(
          'Home Cleaning',
          style: AppTextStyle.serviceItemTextStyle,
        )
      ],
    );
