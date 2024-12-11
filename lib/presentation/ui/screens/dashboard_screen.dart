import 'package:cardio_care_ai/core/app_data.dart';
import 'package:cardio_care_ai/presentation/state_holders/mqtt_controller.dart';
import 'package:cardio_care_ai/presentation/ui/screens/finger_placement_screen.dart';
import 'package:cardio_care_ai/presentation/ui/screens/widget/bar_graph.dart';
import 'package:cardio_care_ai/presentation/ui/screens/widget/other_values.dart';
import 'package:cardio_care_ai/presentation/ui/utility/app_colors.dart';
import 'package:cardio_care_ai/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double measurePer(int per) {
    if (per / 100 > 1.0) {
      return 1.0;
    } else {
      return per / 100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "Dashboard",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/62952159?v=4"),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome,",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, color: AppColors.greyColor),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Shukur Alam!",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: AppColors.greyColor),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.appColor.withOpacity(.4),
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "Previous Heart Status",
                    style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.greyColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<MqttController>(builder: (controller) {
                return Center(
                  child: CircularPercentIndicator(
                    radius: 90.0, // Radius of the circle
                    lineWidth: 25.0, // Thickness of the progress bar
                    percent: measurePer(
                        controller.bp), // Percentage value (from 0.0 to 1.0)
                    circularStrokeCap: CircularStrokeCap.round, // Rounded ends
                    backgroundColor: AppColors.appColor
                        .withOpacity(.4), // Background color of the indicator
                    progressColor: AppColors.appColor, // Progress bar color
                    startAngle: 0.0,
                    animationDuration:
                        2000, // Starting angle to create a semi-circle
                    center: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: const FingerPlacementScreen(
                                  isDashboard: true,
                                ),
                                type: PageTransitionType.rightToLeft,
                                duration: const Duration(milliseconds: 500),
                              ),
                            );
                          },
                          child: Text(
                            "${controller.bp}", // The main value (dynamic)
                            style: GoogleFonts.outfit(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Text(
                          'RPM', // Label below the number
                          style: GoogleFonts.outfit(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Weekly Heart Status',
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColors.greyColor),
              ),
              const SizedBox(
                height: 5,
              ),

              //BarGraph
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
                child: BarGraph(
                  weeklySummery: AppData.rpmPerDay,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<MqttController>(builder: (mqttController) {
                return Row(
                  children: [
                    OtherValues(
                      imageName: AssetsPath.personSpo2,
                      text: 'Oxygen Level',
                      icon: Icons.heat_pump_outlined,
                      sign: "%",
                      value: mqttController.spo2,
                    ),
                    const SizedBox(
                      width: 27,
                    ),
                    OtherValues(
                      imageName: AssetsPath.personTemp2,
                      text: 'Temperature',
                      icon: Icons.thermostat,
                      sign: "°C",
                      value: mqttController.temperature,
                    ),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
