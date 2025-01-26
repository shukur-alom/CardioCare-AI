import 'package:cardio_care_ai/data/models/doctor.dart';
import 'package:cardio_care_ai/data/models/heart_advice.dart';
import 'package:cardio_care_ai/presentation/ui/utility/assets_path.dart';
import 'package:flutter/material.dart';

class AppData {
  const AppData._();

  static List<Doctor> doctors = [
    Doctor(AssetsPath.doctor_1, "Dr John", "7 Years experience", "87%",
        "69 patient stories", "10:00"),
    Doctor(AssetsPath.doctor_2, "Dr Sabrina", "9 Years experience", "74%",
        "78 patient stories", "12:00"),
    Doctor(AssetsPath.doctor_3, "Dr Rihana", "5 Years experience", "59%",
        "86 patient stories", "11:00"),
    Doctor(AssetsPath.doctor_4, "Dr Hammad", "6 Years experience", "87%",
        "69 patient stories", "10:00"),
  ];

  static List<HeartAdvice> advices = [
    HeartAdvice(AssetsPath.exercise, "Do regular Exercise"),
    HeartAdvice(AssetsPath.avoidSmoking, "Avoid smoking or drinking Alcohol"),
    HeartAdvice(AssetsPath.healthyDiet, "Maintain healthy diet"),
    HeartAdvice(AssetsPath.healthyWeight, "Maintain healthy weight"),
  ];
  static List<HeartAdvice> doctorsAdvice = [
    HeartAdvice(AssetsPath.wellness, "Adopt a Heart-Healthy Lifestyle"),
    HeartAdvice(AssetsPath.nutrition, "Avoid Excessive Physical Strain"),
    HeartAdvice(AssetsPath.insomnia, "Manage Stress and Sleep"),
    HeartAdvice(AssetsPath.ecg, "Confirm with Diagnostic Tests \n(ECG/EKG)"),
  ];

  static List<DropdownMenuItem> gender = [
    const DropdownMenuItem(
      value: '1',
      child: Text("Male"),
    ),
    const DropdownMenuItem(
      value: '0',
      child: Text("Female"),
    ),
    const DropdownMenuItem(
      value: "Other",
      child: Text("Other"),
    ),
  ];
  static List<DropdownMenuItem> chestPainType = [
    const DropdownMenuItem(
      value: "0",
      child: Text("0"),
    ),
    const DropdownMenuItem(
      value: "1",
      child: Text("1"),
    ),
    const DropdownMenuItem(
      value: "2",
      child: Text("2"),
    ),
    const DropdownMenuItem(
      value: "3",
      child: Text("3"),
    ),
    const DropdownMenuItem(
      value: "4",
      child: Text("4"),
    ),
  ];
  static List<DropdownMenuItem> painDuringExercise = [
    const DropdownMenuItem(
      value: "1",
      child: Text("Yes"),
    ),
    const DropdownMenuItem(
      value: "0",
      child: Text("No"),
    ),
  ];

  static List<double> rpmPerDay = [
    100.12,
    85.20,
    80.89,
    104.25,
    80.36,
    90.23,
    98.12
  ];
}
