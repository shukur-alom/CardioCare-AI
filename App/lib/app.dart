import 'package:cardio_care_ai/controller_binder.dart';
import 'package:cardio_care_ai/presentation/ui/screens/auth/log_in_screen.dart';
import 'package:cardio_care_ai/presentation/ui/utility/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardioCareAI extends StatelessWidget {
  const CardioCareAI({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CardioCareAI",
      home: const LogInScreen(),
      theme: AppThemeData.lightThemeData,
      initialBinding: ControllerBinder(),
    );
  }
}
