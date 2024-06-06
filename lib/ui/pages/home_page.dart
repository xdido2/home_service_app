import 'package:flutter/material.dart';
import 'package:home_service_app/ui/data/get_categories.dart';
import 'package:home_service_app/ui/pages/category/category_item_list.dart';
import 'package:home_service_app/ui/pages/product_detail_page.dart';
import 'package:home_service_app/ui/router/app_routes.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';
import 'package:home_service_app/ui/pages/booking_page.dart';
import 'package:home_service_app/ui/view/navdraw_view.dart';
import 'package:home_service_app/ui/widget/cleaning_service_item.dart';
import 'package:home_service_app/ui/widget/cotegory_item.dart';
import 'package:home_service_app/ui/widget/offers_item.dart';
import 'package:home_service_app/ui/widget/text_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> view = <Widget>[
    const HomePageBody(),
    const BookingsPageView(),
    const BookingsPageView(),
    const BookingsPageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: const NavDrawer(),
      appBar: const HomePageAppBar(),
      body: view[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: AppColors.secondaryColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.activeIconColor,
        unselectedItemColor: AppColors.inactiveIconColor,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: '',
            icon: ImageIcon(
              AssetImage('assets/images/icons/app_icons/home_page_icon.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: ImageIcon(
              AssetImage('assets/images/icons/app_icons/list_icon.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: ImageIcon(
              AssetImage('assets/images/icons/app_icons/notification_icon.png'),
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: ImageIcon(
              AssetImage('assets/images/icons/app_icons/chat_icon.png'),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.secondaryColor,
        padding: const EdgeInsets.only(
          left: 16,
        ),
        child: Column(
          children: [
            ListTile(
              leading: InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const ImageIcon(
                  AssetImage('assets/images/icons/app_icons/menu_icon.png'),
                  size: 32,
                  color: AppColors.activeIconColor,
                ),
              ),
              title: Text(
                'Current Location'.toUpperCase(),
                style: AppTextStyle.appBarTextStyle,
              ),
              subtitle: Text(
                '15A, James Street',
                style: AppTextStyle.appBarTextStyle.copyWith(
                  color: AppColors.primaryTextColor,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 72);
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          WelcomeCard(),
          SizedBox(
            height: 16,
          ),
          CategoriesRow(),
          SizedBox(
            height: 16,
          ),
          ServiceRow(
            name: 'Cleaning Services',
          ),
          SizedBox(
            height: 16,
          ),
          OffersRow(),
        ],
      ),
    );
  }
}

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 210,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.secondaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hello Ashfak 👋'.toUpperCase(),
              style: AppTextStyle.welcomeCardTextStyle),
          Text(
            'What you are looking for today',
            style: AppTextStyle.welcomeCardTextStyle.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryTextColor,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          textFieldWidget(context, 'Search what you need...', false),
        ],
      ),
    );
  }
}

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    final List data = AppCategories.data.values.toList();
    return Container(
      height: 117,
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.secondaryColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 26,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {},
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryItemList(
                        index: index,
                      ),
                    ),
                  ),
                  child: categoryItem(
                    context,
                    data[index]['title'],
                    data[index]['icon_path'],
                    data[index]['color'],
                    false,
                    false,
                  ),
                ),
              ),
              itemCount: 3,
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, AppRoutes.categories),
            child: categoryItem(
              context,
              'See All',
              'assets/images/icons/app_icons/backBtn_icon.png',
              AppColors.rowCategoriesBackBtnColor,
              true,
              false,
            ),
          )
        ],
      ),
    );
  }
}

class ServiceRow extends StatelessWidget {
  final String name;

  const ServiceRow({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 267,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.secondaryColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    name,
                    style: AppTextStyle.serviceRowTitleTextStyle,
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                style: const ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(Size(89, 35)),
                  side: WidgetStatePropertyAll(
                    BorderSide(
                      color: AppColors.rowCategoriesBackBtnBorderColor,
                      // your color here
                      width: 1.5,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'See All',
                      style: AppTextStyle.serviceRowTitleTextStyle.copyWith(
                        fontSize: 12,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    const ImageIcon(
                      size: 13,
                      color: AppColors.secondaryTextColor,
                      AssetImage(
                          'assets/images/icons/app_icons/seeAll_icon.png'),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceDetailPage(
                      index: index,
                    ),
                  ),
                ),
                child: serviceItem(context, 10),
              ),
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}

class OffersRow extends StatelessWidget {
  const OffersRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.secondaryColor,
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 16,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            offersItem(context, AppColors.firstOffersCardItemColor),
        itemCount: 6,
      ),
    );
  }
}
