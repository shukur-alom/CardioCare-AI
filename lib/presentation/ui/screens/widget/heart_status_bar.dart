import 'package:cardio_care_ai/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeartStatusBar extends StatelessWidget {
  const HeartStatusBar({
    super.key,
    required this.status,
    required this.color,
  });
  final String status;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: color.withOpacity(0.4),
          borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          status,
          style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.greyColor),
        ),
      ),
    );
  }
}
