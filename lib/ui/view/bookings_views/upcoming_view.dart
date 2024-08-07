import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:home_service_app/ui/data/get_categories.dart';
import 'package:home_service_app/ui/router/app_routes.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';

class UpcomingView extends StatelessWidget {
  const UpcomingView({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseDatabase database = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
          'https://home-service-app-5b988-default-rtdb.asia-southeast1.firebasedatabase.app/',
    );
    DatabaseReference ref = database.ref('Bookings');
    return Expanded(
      child: FirebaseAnimatedList(
        reverse: true,
        query: ref,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) =>
            Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SizeTransition(
            sizeFactor: animation,
            child: UpcomingItem(
              categoryId:
                  int.parse(snapshot.child('categoryId').value.toString()),
              title: snapshot.child('title').value.toString(),
              time: snapshot.child('time').value.toString(),
              date: snapshot.child('date').value.toString(),
            ),
          ),
        ),
      ),
    );
  }
}

class UpcomingItem extends StatelessWidget {
  final int categoryId;
  final String title;
  final String time;
  final String date;

  const UpcomingItem({
    super.key,
    required this.categoryId,
    required this.title,
    required this.time,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final category = AppCategories.data.values.toList();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.secondaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: category[categoryId]['color'],
                ),
                padding: const EdgeInsets.all(16),
                child: Image(
                  color: AppColors.categoryIconColor,
                  image: AssetImage(category[categoryId]['icon_path']),
                ),
              ),
              const SizedBox(
                width: 17,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.bookingsListTitleTextStyle,
                  ),
                  Text(
                    'Reference Code: #D-571224',
                    style: AppTextStyle.bookingsListTitleTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            color: AppColors.iconBtnColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status',
                style: AppTextStyle.bookingsListTitleTextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              Container(
                width: 87,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.bookingStatusColor,
                ),
                child: Center(
                  child: Text(
                    'Confirmed',
                    style: AppTextStyle.bookingsListTitleTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      color: AppColors.bookingStatusTextColor,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          UpcomingDetail(
            path: 'assets/images/icons/app_icons/calendar_icon2.png',
            time: time,
            date: date,
            isCompany: false,
          ),
          const SizedBox(
            height: 16,
          ),
          UpcomingDetail(
            path: 'assets/images/icons/app_icons/company_icon.png',
            time: time,
            date: date,
            isCompany: true,
          ),
        ],
      ),
    );
  }
}

class UpcomingDetail extends StatelessWidget {
  final String path;
  final String? date;
  final String? time;
  final bool isCompany;

  const UpcomingDetail(
      {super.key,
      required this.path,
      required this.date,
      required this.time,
      required this.isCompany});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                color: AppColors.secondaryColor,
                border: Border.all(
                  color: AppColors.productDetailBtnBorderColor,
                ),
              ),
              child: Image.asset(
                path,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isCompany == true ? 'Westinghouse' : '$time, $date',
                  style: AppTextStyle.bookingsListTimeTableTextStyle,
                ),
                Text(
                  isCompany == true ? 'Service provider' : 'Schedule',
                  style: AppTextStyle.bookingsListTimeTableTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        isCompany == true
            ? ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  minimumSize: const WidgetStatePropertyAll(Size(81, 40)),
                  backgroundColor:
                      const WidgetStatePropertyAll(AppColors.thirdColor),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const ImageIcon(
                      AssetImage(
                          'assets/images/icons/app_icons/support_icon.png'),
                      size: 20,
                      color: AppColors.activeIconColor,
                    ),
                    Text(
                      'Call',
                      style: AppTextStyle.bookingsListTimeTableTextStyle,
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}

class UpcomingEmpty extends StatelessWidget {
  const UpcomingEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 120,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.secondaryColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/icons/app_icons/empty_list_icon.png',
              height: 86,
              width: 86,
            ),
            Text(
              'No Upcoming Order',
              style: AppTextStyle.bookingsEmptyListTextStyle,
            ),
            Text(
              'Currently you don’t have any upcoming order. \nPlace and track your orders from here.',
              textAlign: TextAlign.center,
              style: AppTextStyle.bookingsEmptyListTextStyle.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.secondaryTextColor,
              ),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.categories),
              style: ButtonStyle(
                  minimumSize: const WidgetStatePropertyAll(Size(166, 48)),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  backgroundColor:
                      const WidgetStatePropertyAll(AppColors.thirdColor)),
              child: Text(
                'View all services',
                style: AppTextStyle.bookingsEmptyListTextStyle.copyWith(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
