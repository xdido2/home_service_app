import 'package:flutter/material.dart';
import 'package:home_service_app/domain/provider/bookings_provider.dart';
import 'package:home_service_app/ui/router/app_router.dart';
import 'package:home_service_app/ui/theme/app_color.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookingsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.primaryColor
        ),
        initialRoute: AppRouter.initialRoute,
        routes: AppRouter.routes,
      ),
    );
  }
}
