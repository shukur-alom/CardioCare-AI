import 'package:cardio_care_ai/data/models/create_status_params.dart';
import 'package:cardio_care_ai/presentation/state_holders/local_storage_controller.dart';
import 'package:cardio_care_ai/presentation/state_holders/mqtt_controller.dart';
import 'package:cardio_care_ai/presentation/state_holders/prediction_controller.dart';
import 'package:cardio_care_ai/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:cardio_care_ai/presentation/ui/screens/result_screen.dart';
import 'package:cardio_care_ai/presentation/ui/utility/app_colors.dart';
import 'package:cardio_care_ai/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FingerPlacementScreen extends StatefulWidget {
  const FingerPlacementScreen(
      {super.key,
      required this.isDashboard,
      this.age,
      this.sex,
      this.chestPainType,
      this.exerciseAngina});
  final bool isDashboard;
  final String? age;
  final String? sex;
  final String? chestPainType;
  final String? exerciseAngina;

  @override
  State<FingerPlacementScreen> createState() => _FingerPlacementScreenState();
}

class _FingerPlacementScreenState extends State<FingerPlacementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "Finger Placement",
          style: GoogleFonts.montserrat(fontSize: 20),
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
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Text(
            "Put your finger on the device",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: GetBuilder<MqttController>(builder: (controller) {
              if (controller.percentage >= 100) {
                controller.percentage = 0;
                Get.find<LocalStorageController>().saveDashboardStatus(
                    controller.bp, controller.spo2, controller.temperature);
                Future.delayed(Duration.zero, () async {
                  if (widget.isDashboard) {
                    Future.delayed(Duration.zero, () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          child: const MainBottomNavBarScreen(),
                          type: PageTransitionType.rightToLeft,
                          duration: const Duration(milliseconds: 500),
                        ),
                        (Route<dynamic> route) => false,
                      ); // Navigate to the next screen
                    });
                  } else {
                    final createStatusParams = CreateStatusParams(
                        age: widget.age ?? "",
                        sex: widget.sex ?? '',
                        chestPainType: widget.chestPainType ?? '',
                        restingBpS: controller.bp,
                        exerciseAngina: widget.exerciseAngina ?? '');
                    final result = await Get.find<PredictionController>()
                        .predict(createStatusParams);
                    if (result) {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: ResultScreen(
                              status: Get.find<PredictionController>()
                                  .predictionAns
                                  .index!),
                          type: PageTransitionType.rightToLeft,
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    } else {
                      Get.showSnackbar(
                        const GetSnackBar(
                          title: 'Failed',
                          message: 'Something went wrong. Please try again.',
                          isDismissible: true,
                          backgroundColor: Colors.redAccent,
                          snackPosition: SnackPosition.TOP,
                        ),
                      );
                    }
                  }
                });
                // Reset the percentage and navigate to the next screen
              }
              return CircularPercentIndicator(
                radius: 150,
                lineWidth: 30,
                percent: controller.percentage / 100,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: AppColors.appColor,
                backgroundColor: AppColors.appColor.withOpacity(0.4),
                center: Image.asset(
                  AssetsPath.fingerIcon,
                  width: 200,
                  height: 200,
                ),
                animationDuration: 1500,
              );
            }),
          ),
        ],
      ),
    );
  }
}
