import 'package:get/get.dart';

import '../../data/models/create_status_params.dart';
import '../../data/models/prediction_ans.dart';
import '../../data/service/network_caller.dart';
import '../../data/utility/urls.dart';

class PredictionController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  PredictionAns _predictionAns = PredictionAns();

  bool get inProgress => _inProgress;
  String get errorMessage => _errorMessage;
  PredictionAns get predictionAns => _predictionAns;

  Future<bool> predict(CreateStatusParams params) async {
    try {
      _inProgress = true; // Start progress
      update(); // Notify listeners

      final response = await NetworkCaller()
          .postRequest(Urls.prediction, body: params.toJson());

      _inProgress = false; // End progress
      if (response.isSuccess) {
        _predictionAns = PredictionAns.fromJson(response.responseData ?? {});
        update(); // Notify listeners again for data update
        return true;
      } else {
        _errorMessage = response.errorMessage ?? "An error occurred";
        update();
      }
    } catch (e) {
      _inProgress = false; // Ensure progress is stopped in case of exceptions
      _errorMessage = "An error occurred: $e";
      update();
    }
    return false;
  }
}
