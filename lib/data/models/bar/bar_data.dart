import 'package:cardio_care_ai/data/models/bar/individual_bar.dart';

class BarData {
  final double satRpm;
  final double sunRpm;
  final double monRpm;
  final double tueRpm;
  final double wedRpm;
  final double thuRpm;
  final double friRpm;

  BarData(
      {required this.satRpm,
      required this.sunRpm,
      required this.monRpm,
      required this.tueRpm,
      required this.wedRpm,
      required this.thuRpm,
      required this.friRpm});

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      IndividualBar(x: 0, y: satRpm),
      IndividualBar(x: 1, y: sunRpm),
      IndividualBar(x: 2, y: monRpm),
      IndividualBar(x: 3, y: tueRpm),
      IndividualBar(x: 4, y: wedRpm),
      IndividualBar(x: 5, y: thuRpm),
      IndividualBar(x: 6, y: friRpm),
    ];
  }
}
