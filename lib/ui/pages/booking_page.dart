import 'package:flutter/material.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';
import 'package:home_service_app/ui/view/bookings_views/upcoming_view.dart';

class BookingsPageView extends StatefulWidget {
  const BookingsPageView({super.key});

  @override
  State<BookingsPageView> createState() => _BookingsPageViewState();
}

class _BookingsPageViewState extends State<BookingsPageView> {
  int selectedIndex = 0; // Initially, no button is selected

  void _handleButtonPress(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> views = <Widget>[
      const UpcomingView(),
      const UpcomingView(),
      const UpcomingView(),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      color: AppColors.primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.thirdColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Bookings',
                style: AppTextStyle.serviceRowTitleTextStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.secondaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _handleButtonPress(0),
                  style: ButtonStyle(
                    minimumSize: const WidgetStatePropertyAll(Size(105, 40)),
                    backgroundColor: selectedIndex == 0
                        ? const WidgetStatePropertyAll(
                            AppColors.bookingTabBarBtnColor)
                        : const WidgetStatePropertyAll(
                            AppColors.secondaryColor),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    'Upcoming',
                    style: AppTextStyle.bookingTabBarBtnTextStyle,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _handleButtonPress(1),
                  style: ButtonStyle(
                    minimumSize: const WidgetStatePropertyAll(Size(105, 40)),
                    backgroundColor: selectedIndex == 1
                        ? const WidgetStatePropertyAll(
                            AppColors.bookingTabBarBtnColor)
                        : const WidgetStatePropertyAll(
                            AppColors.secondaryColor),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    'History',
                    style: AppTextStyle.bookingTabBarBtnTextStyle,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _handleButtonPress(2),
                  style: ButtonStyle(
                    minimumSize: const WidgetStatePropertyAll(Size(105, 40)),
                    backgroundColor: selectedIndex == 2
                        ? const WidgetStatePropertyAll(
                            AppColors.bookingTabBarBtnColor)
                        : const WidgetStatePropertyAll(
                            AppColors.secondaryColor),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Text(
                    'Draft',
                    style: AppTextStyle.bookingTabBarBtnTextStyle,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          views[selectedIndex],
        ],
      ),
    );
  }
}
