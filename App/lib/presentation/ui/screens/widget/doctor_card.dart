import 'package:cardio_care_ai/data/models/doctor.dart';
import 'package:cardio_care_ai/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doctors});

  final List<Doctor> doctors;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        Doctor doctor = doctors[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        doctor.image,
                        height: 87,
                        width: 92,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Ensure spacing
                            children: [
                              Text(
                                doctor.name,
                                style: GoogleFonts.montserrat(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 35,
                              ),
                            ],
                          ),
                          Text(
                            'Cardiologist',
                            style: GoogleFonts.montserrat(
                                fontSize: 15, color: AppColors.appColor),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                color: AppColors.appColor,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                doctor.percen,
                                style: GoogleFonts.montserrat(
                                    fontSize: 15, color: Colors.grey[700]),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const Icon(
                                Icons.circle,
                                color: AppColors.appColor,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                doctor.stories,
                                style: GoogleFonts.montserrat(
                                    fontSize: 15, color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Next Available",
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColors.appColor),
                        ),
                        Text(
                          "${doctor.available} AM tomorrow",
                          style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8), // Adjust padding
                      ),
                      child: Text(
                        'Book Now',
                        style: GoogleFonts.montserrat(
                            fontSize: 15), // Adjust font size
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 6,
        );
      },
      itemCount: doctors.length,
    );
  }
}
