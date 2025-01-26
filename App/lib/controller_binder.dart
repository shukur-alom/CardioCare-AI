import 'package:cardio_care_ai/presentation/state_holders/local_storage_controller.dart';
import 'package:cardio_care_ai/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:cardio_care_ai/presentation/state_holders/mqtt_controller.dart';
import 'package:cardio_care_ai/presentation/state_holders/prediction_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(PredictionController());
    Get.put(MainBottomNavController());
    Get.put(LocalStorageController());
    Get.put(MqttController());
  }
}
