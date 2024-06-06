import 'package:flutter/material.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:home_service_app/ui/theme/app_text_style.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.secondaryColor,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              buildHeader(context),
              Expanded(
                child: ListView(
                  children: const <Widget>[
                    NavDrawerItem(
                      title: 'Calendar',
                      path: 'assets/images/icons/app_icons/calendar_icon.png',
                    ),
                    NavDrawerItem(
                      title: 'Payments Methods',
                      path: 'assets/images/icons/app_icons/wallet_icon.png',
                    ),
                    NavDrawerItem(
                      title: 'Address',
                      path: 'assets/images/icons/app_icons/address_icon.png',
                    ),
                    NavDrawerItem(
                      title: 'Notification',
                      path: 'assets/images/icons/app_icons/notification_icon.png',
                    ),
                    NavDrawerItem(
                      title: 'Offers',
                      path: 'assets/images/icons/app_icons/offers_icon.png',
                    ),
                    NavDrawerItem(
                      title: 'Refer a Friend',
                      path: 'assets/images/icons/app_icons/refer_a_friend_icon.png',
                    ),
                    NavDrawerItem(
                      title: 'Support',
                      path: 'assets/images/icons/app_icons/support_icon.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatars/img.png'),
        ),
        title: Text(
          'Ashfak Sayem',
          style: AppTextStyle.primaryDrawerTextStyle,
        ),
        subtitle: Text(
          'ashfaksayem@gmail.com',
          style: AppTextStyle.secondaryDrawerTextStyle,
        ),
      );
}

class NavDrawerItem extends StatelessWidget {
  final String title;
  final String path;

  const NavDrawerItem({super.key, required this.title, required this.path});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      // style: const ButtonStyle(
      //   backgroundColor: MaterialStatePropertyAll(AppColors.secondaryColor),
      //   minimumSize: MaterialStatePropertyAll(Size(255, 45)),
      //   shape: MaterialStatePropertyAll(
      //     RoundedRectangleBorder(
      //       borderRadius: BorderRadius.all(Radius.circular(8)),
      //     ),
      //   ),
      // ),
      child: ListTile(
        leading: ImageIcon(AssetImage(path)),
        title: Text(
          title,
          style: AppTextStyle.primaryDrawerTextStyle,
        ),
      ),
    );
  }
}
