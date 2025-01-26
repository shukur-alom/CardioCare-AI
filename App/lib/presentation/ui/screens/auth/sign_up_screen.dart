import 'package:cardio_care_ai/presentation/ui/screens/auth/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _studentIdTEController = TextEditingController();
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 90,
              ),
              Text(
                "Lets Register\nAccount",
                style: GoogleFonts.outfit(
                    fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Hello user , you have\n'
                'a greateful journey',
                style: GoogleFonts.outfit(
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _nameTEController,
                      validator: formValidator,
                      decoration: const InputDecoration(labelText: "Name"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _emailTEController,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(labelText: "Email"),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Please enter an Email address';
                        } else if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                            .hasMatch(value!)) {
                          return 'Please enter a valid email address';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _studentIdTEController,
                      validator: formValidator,
                      decoration:
                          const InputDecoration(labelText: "Student ID"),
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
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                PageTransition(
                                  child: const LogInScreen(),
                                  type: PageTransitionType.rightToLeft,
                                  duration: const Duration(milliseconds: 500),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            } else {
                              Get.snackbar(
                                  backgroundColor: Colors.redAccent,
                                  "Something went wrong!",
                                  "Try again");
                            }
                          },
                          child: Text(
                            "Sign in",
                            style: GoogleFonts.outfit(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: GoogleFonts.outfit(
                              fontSize: 18, color: Colors.grey.shade600),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: const LogInScreen(),
                                type: PageTransitionType.rightToLeft,
                                duration: const Duration(milliseconds: 500),
                              ),
                            );
                          },
                          child: Text(
                            "Login",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
