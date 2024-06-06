import 'package:flutter/material.dart';
import 'package:home_service_app/ui/data/get_categories.dart';
import 'package:home_service_app/ui/pages/category/category_item_list.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';
import 'package:home_service_app/ui/widget/cotegory_item.dart';
import 'package:home_service_app/ui/widget/text_field_widget.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CategoriesAppBar(),
      body: CategoriesBody(),
    );
  }
}

class CategoriesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoriesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: AppColors.secondaryColor,
        child: Center(child: textFieldWidget(context, 'Search Category', true)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 72);
}

class CategoriesBody extends StatelessWidget implements PreferredSizeWidget {
  const CategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(13),
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
                'All Categories',
                style: AppTextStyle.serviceRowTitleTextStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const CategoriesList(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 72);
}

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final List data = AppCategories.data.values.toList();
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // number of items in each row
          mainAxisSpacing: 24, // spacing between rows
          crossAxisSpacing: 45, // spacing between columns
        ),
        itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryItemList(
                      index: index,
                    ),
                  ),
                ),
            child: categoryItem(context, data[index]['title'],
                data[index]['icon_path'], data[index]['color'], false, true)),
        itemCount: data.length,
      ),
    );
  }
}
