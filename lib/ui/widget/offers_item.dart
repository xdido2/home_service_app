import 'package:flutter/material.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';

Widget offersItem(BuildContext context, Color color) => Container(
      height: 158,
      width: 289,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 27),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Offer AC Service',
                style: AppTextStyle.offerCardTitleTextStyle,
              ),
              const SizedBox(
                width: 5.33,
              ),
              InkWell(
                onTap: () {},
                child: const ImageIcon(
                  AssetImage('assets/images/icons/app_icons/info_icon.png'),
                  size: 13.33,
                ),
              )
            ],
          ),
          Text(
            'Get 25%',
            style: AppTextStyle.offerCardDiscountTextStyle,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 30,
              width: 106,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.offerCardBtnColor,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Grab Offer',
                      style: AppTextStyle.offerCardBtnTextStyle,
                    ),
                    const ImageIcon(
                      AssetImage('assets/images/icons/app_icons/seeAll_icon.png'),
                      color: AppColors.offerCardBtnTextColor,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
