import 'package:home_service_app/ui/theme/app_color.dart';

abstract final class AppCategories {
  static const Map<int, Map<String, dynamic>> data = {
    1: {
      'title': 'AC Service',
      'color': AppColors.acServiceCategoryItemColor,
      'icon_path': 'assets/images/icons/category_icons/acService_icon.png',
    },
    2: {
      'title': 'Beauty',
      'color': AppColors.beautyCategoryItemColor,
      'icon_path': 'assets/images/icons/category_icons/beauty_icon.png',
    },
    3: {
      'title': 'Appliance',
      'color': AppColors.applianceCategoryItemColor,
      'icon_path': 'assets/images/icons/category_icons/appliance_icon.png',
    },
    4: {
      'title': 'Painting',
      'color': AppColors.paintingCategoryItemColor,
      'icon_path': 'assets/images/icons/category_icons/painting_icon.png',
    },
    5: {
      'title': 'Cleaning',
      'color': AppColors.cleaningCategoryItemColor,
      'icon_path': 'assets/images/icons/category_icons/cleaning_icon.png',
    },
    6: {
      'title': 'Plumbing',
      'color': AppColors.plumbingCategoryItemColor,
      'icon_path': 'assets/images/icons/category_icons/plumbing_icon.png',
    },
    7: {
      'title': 'Electronics',
      'color': AppColors.electronicsCategoryItemColor,
      'icon_path': 'assets/images/icons/category_icons/electronics_icon.png',
    },
    8: {
      'title': 'Shifting',
      'color': AppColors.shiftingCategoryItemColor,
      'icon_path': 'assets/images/icons/category_icons/shifting_icon.png',
    },
    9: {
      'title': "Men's Salon",
      'color': AppColors.mensSalonCategoryItemColor,
      'icon_path': 'assets/images/icons/category_icons/mensSalon_icon.png',
    },
  };
}
