import 'package:cardio_care_ai/data/models/heart_advice.dart';
import 'package:cardio_care_ai/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HealthyHeartAdvices extends StatelessWidget {
  const HealthyHeartAdvices({
    super.key,
    required this.advice,
    required this.isDoctor,
  });

  final List<HeartAdvice> advice;
  final bool isDoctor;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          HeartAdvice heartAdvice = advice[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.white, borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Image.asset(
                  heartAdvice.img,
                  color:
                      isDoctor ? AppColors.resultRedColor : AppColors.appColor,
                  height: 40,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  heartAdvice.advice,
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyColor),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(height: 20);
        },
        itemCount: advice.length);
  }
}
