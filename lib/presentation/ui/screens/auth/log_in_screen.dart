import 'package:cardio_care_ai/presentation/state_holders/local_storage_controller.dart';
import 'package:cardio_care_ai/presentation/state_holders/mqtt_controller.dart';
import 'package:cardio_care_ai/presentation/ui/screens/auth/sign_up_screen.dart';
import 'package:cardio_care_ai/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:cardio_care_ai/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  String? formValidator(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'This field is required';
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    Get.find<LocalStorageController>().initialize();
    Get.find<MqttController>().connectToMqtt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 90,
                ),
                Text(
                  "Lets Sign you in",
                  style: GoogleFonts.outfit(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome back ,\n'
                  'You have been missed',
                  style: GoogleFonts.outfit(
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _emailTEController,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Please enter an Email address';
                    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                        .hasMatch(value!)) {
                      return 'Please enter a valid email address';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _passwordTEController,
                  validator: formValidator,
                  textInputAction: TextInputAction.done,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible =
                              !_isPasswordVisible; // Toggle state
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password?",
                        style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Get.offAll(
                            () => const MainBottomNavBarScreen(),
                          );
                        }
                      },
                      child: Text(
                        "Sign in",
                        style: GoogleFonts.outfit(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  children: [
                    Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'or',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsPath.googleIcon, // Replace with your image path
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(width: 20),
                    Image.asset(
                      AssetsPath.facebookIcon, // Replace with your image path
                      height: 40,
                      width: 30,
                    ),
                    const SizedBox(width: 20),
                    Image.asset(
                      AssetsPath.appleIcon, // Replace with your image path
                      height: 40,
                      width: 50,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do not have an account?",
                      style: GoogleFonts.outfit(
                          fontSize: 18, color: Colors.grey.shade600),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const SignUpScreen(),
                            type: PageTransitionType.rightToLeft,
                            duration: const Duration(milliseconds: 500),
                          ),
                        );
                      },
                      child: Text(
                        "Register Now",
                        style: GoogleFonts.outfit(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
