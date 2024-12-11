import 'dart:math';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageController extends GetxController {
  static int? _rpm;
  int get rpm => _rpm ?? 0;
  static double? _spo, _temp;
  double get spo => _spo ?? 0;
  double get temp => _temp ?? 0;
  Future<void> saveDashboardStatus(int r, double oxy, double t) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('rpm', r);
    sharedPreferences.setDouble('spo', oxy);
    sharedPreferences.setDouble('temp', t);
    log(r);
    log(oxy);
    log(t);
  }

  Future<void> initialize() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _rpm = sharedPreferences.getInt('rpm');
    _spo = sharedPreferences.getDouble('spo');
    _temp = sharedPreferences.getDouble('temp');
  }

  static Future<void> cleatData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
