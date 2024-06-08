import 'package:flutter/material.dart';
import 'package:home_service_app/ui/pages/auth/sign_in_page.dart';
import 'package:home_service_app/ui/pages/auth/sign_up_page.dart';
import 'package:home_service_app/ui/pages/category/categories_page.dart';
import 'package:home_service_app/ui/pages/home_page.dart';
import 'package:home_service_app/ui/router/app_routes.dart';

abstract final class AppRouter{
  static String get initialRoute => AppRoutes.home;

  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.home: (context) => const HomePage(),
    AppRoutes.categories: (context) => const CategoriesPage(),
    AppRoutes.signUp: (context) => const SingUpPage(),
    AppRoutes.signIn: (context) => const SingInPage(),
  };
}