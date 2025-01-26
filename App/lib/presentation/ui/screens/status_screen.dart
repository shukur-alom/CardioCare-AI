import 'package:cardio_care_ai/core/app_data.dart';
import 'package:cardio_care_ai/presentation/ui/screens/finger_placement_screen.dart';
import 'package:cardio_care_ai/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  String selectedGender = "none";
  String selectedChestPainType = "none";
  String painDuringExercise = "none";
  final TextEditingController _ageTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackground,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "Status",
          style: GoogleFonts.montserrat(fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {},
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
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Age: ",
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: _ageTEController,
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'This field can not remain empty';
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(labelText: "Enter Your age"),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Gender: ",
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                DropdownButtonFormField(
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    hint: Text(
                      "Select Gender",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: AppColors.hintColor,
                      ),
                    ),
                    icon: const Icon(Icons.arrow_drop_down_outlined),
                    items: AppData.gender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    }),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Chest Pain Type: ",
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                DropdownButtonFormField(
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    hint: Text(
                      "Select Chest Pain Type",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: AppColors.hintColor,
                      ),
                    ),
                    items: AppData.chestPainType,
                    onChanged: (value) {
                      setState(() {
                        selectedChestPainType = value;
                      });
                    }),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Pain During Exercise: ",
                  style: GoogleFonts.montserrat(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                DropdownButtonFormField(
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    hint: Text(
                      "Select Magnitude",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: AppColors.hintColor,
                      ),
                    ),
                    items: AppData.painDuringExercise,
                    onChanged: (value) {
                      setState(() {
                        painDuringExercise = value;
                      });
                    }),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            selectedGender != 'none' &&
                            selectedChestPainType != "none" &&
                            painDuringExercise != 'none') {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: FingerPlacementScreen(
                                isDashboard: false,
                                age: _ageTEController.text.trim(),
                                sex: selectedGender,
                                chestPainType: selectedChestPainType,
                                exerciseAngina: painDuringExercise,
                              ),
                              type: PageTransitionType.rightToLeft,
                              duration: const Duration(milliseconds: 500),
                            ),
                          );
                        } else {
                          Get.showSnackbar(
                            const GetSnackBar(
                              title: 'Field is empty',
                              message: 'All fields are required to fill',
                              isDismissible: true,
                              backgroundColor: Colors.redAccent,
                              snackPosition: SnackPosition.TOP,
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "Submit",
                        style: GoogleFonts.outfit(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
