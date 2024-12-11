import 'package:cardio_care_ai/core/app_data.dart';
import 'package:cardio_care_ai/presentation/state_holders/mqtt_controller.dart';
import 'package:cardio_care_ai/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:cardio_care_ai/presentation/ui/screens/widget/heart_status_bar.dart';
import 'package:cardio_care_ai/presentation/ui/screens/widget/helthy_heart_advice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utility/app_colors.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.status});
  final String status;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "Result",
          style: GoogleFonts.montserrat(fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            Get.offAll(() => const MainBottomNavBarScreen());
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: const [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.more_vert),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GetBuilder<MqttController>(builder: (controller) {
                return CircularPercentIndicator(
                  radius: 100,
                  lineWidth: 20,
                  backgroundColor: widget.status == "1"
                      ? AppColors.appColor
                      : AppColors.resultRedColor,
                  center: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "    Current\nHeart Status",
                        style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "${controller.bp}", // The main value (dynamic)
                        style: GoogleFonts.outfit(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "RPM",
                        style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 30,
            ),
            HeartStatusBar(
              color: widget.status == '1'
                  ? AppColors.appColor
                  : AppColors.resultRedColor,
              status: widget.status == '1'
                  ? "Heart Status: Normal"
                  : "Heart Status: Abnormal",
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              widget.status == '1'
                  ? "For a healthy heart:"
                  : 'Here are some doctors advice',
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.greyColor),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: HealthyHeartAdvices(
                advice: widget.status == '1'
                    ? AppData.advices
                    : AppData.doctorsAdvice,
                isDoctor: widget.status == '1' ? false : true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
