import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_service_app/ui/data/get_categories.dart';
import 'package:home_service_app/ui/pages/category/categories_page.dart';
import 'package:home_service_app/ui/pages/product_detail_page.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';

class CategoryItemList extends StatelessWidget {
  final int index;

  const CategoryItemList({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CategoriesAppBar(),
      body: CategoryItemListBody(new_index: index),
    );
  }
}

class CategoryItemListBody extends StatelessWidget {
  final int new_index;

  const CategoryItemListBody({super.key, required this.new_index});

  @override
  Widget build(BuildContext context) {
    final List category = AppCategories.data.values.toList();
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                color: AppColors.thirdColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                category[new_index]['title'],
                style: AppTextStyle.serviceRowTitleTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                color: AppColors.dividerColor,
              ),
              itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceDetailPage(categoryId: new_index,
                            index: index,),
                        ),
                      ),
                  child: CategoryItem(
                    category: category[new_index]['title'],
                    index: index,
                  ),),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String category;
  final int index;

  const CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: const Image(
            image: AssetImage('assets/images/service/acService.png'),
            height: 116,
            width: 105,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      image:
                          AssetImage('assets/images/icons/app_icons/star.png'),
                      height: 13,
                      width: 13,
                    ),
                    Text(
                      '4.8',
                      style: AppTextStyle.categoryListItemTextStyle,
                    ),
                    Text(
                      '(87)',
                      style: AppTextStyle.categoryListItemTextStyle
                          .copyWith(color: AppColors.thirdTextColor),
                    ),
                  ],
                ),
                InkWell(
                    onTap: () {},
                    child: const Icon(Icons.more_horiz,
                        color: AppColors.thirdTextColor)),
              ],
            ),
            Text(
              '$category $index',
              style: AppTextStyle.categoryListItemTextStyle.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Starts From',
              style: AppTextStyle.categoryListItemTextStyle.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.categoryListItemSubtitleColor,
              ),
            ),
            Container(
              height: 24,
              width: 41,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.categoryListItemPriceBackgroundColor,
              ),
              child: Center(
                child: Text(
                  '\$128',
                  style: AppTextStyle.categoryListItemTextStyle.copyWith(
                    color: AppColors.categoryListItemPriceColor,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}