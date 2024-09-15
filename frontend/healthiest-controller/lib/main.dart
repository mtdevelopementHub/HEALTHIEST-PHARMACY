import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthiest/utils/routes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          //splash screen route
          initialRoute: AppRoutes.splash,
          getPages: AppRoutes.getRoutes,
        );
      },
    );
  }
}
