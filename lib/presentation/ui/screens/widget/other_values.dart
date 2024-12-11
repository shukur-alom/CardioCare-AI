import 'package:cardio_care_ai/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherValues extends StatelessWidget {
  const OtherValues({
    super.key,
    required this.text,
    required this.icon,
    required this.imageName,
    required this.value,
    required this.sign,
  });

  final String text;
  final IconData icon;
  final String imageName;
  final double value;
  final String sign;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 170,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.appColor,
                  size: 20,
                ),
                const SizedBox(width: 8), // Add spacing between icon and text
                Text(
                  text,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 16, // Adjusted to match design
                    color: AppColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Ensure rounded corners
              child: Stack(
                children: [
                  // Ensure the image fully covers the container
                  Positioned.fill(
                    child: Image.asset(
                      imageName,
                      fit: BoxFit
                          .cover, // Replace with your image path// This ensures the image covers the container
                    ),
                  ),
                  // Bottom-left text
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "$value", // Your dynamic value
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: sign,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
