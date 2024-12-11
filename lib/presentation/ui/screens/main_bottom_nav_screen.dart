import 'package:cardio_care_ai/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:cardio_care_ai/presentation/ui/screens/dashboard_screen.dart';
import 'package:cardio_care_ai/presentation/ui/screens/doctor_screen.dart';
import 'package:cardio_care_ai/presentation/ui/screens/profile_screen.dart';
import 'package:cardio_care_ai/presentation/ui/screens/status_screen.dart';
import 'package:cardio_care_ai/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  final List<Widget> _screen = const [
    DashboardScreen(),
    StatusScreen(),
    DoctorScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (controller) {
      return Scaffold(
        body: _screen[controller.currentIndex],
        bottomNavigationBar: NavigationBar(
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded indicator shape
          ),
          height: 80,
          selectedIndex: controller.currentIndex,
          backgroundColor: AppColors.white,
          indicatorColor: AppColors.appColor,
          onDestinationSelected: (index) => controller.changeIndex(index),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.dashboard_outlined), label: 'Dashboard'),
            NavigationDestination(
                icon: Icon(Icons.monitor_heart_outlined), label: 'Status'),
            NavigationDestination(
                icon: Icon(Icons.health_and_safety_outlined), label: 'Doctor'),
            NavigationDestination(
                icon: Icon(Icons.person_outline), label: 'Profile'),
          ],
        ),
      );
    });
  }
}
