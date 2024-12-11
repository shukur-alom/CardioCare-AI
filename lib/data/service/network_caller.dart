import 'dart:convert';
import 'dart:developer';

import 'package:cardio_care_ai/data/models/response_data.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<ResponseData> postRequest(String url,
      {Map<String, dynamic>? body, String? token}) async {
    log(url);
    log(body.toString());
    final Response response = await post(Uri.parse(url),
        body: jsonEncode(body), headers: {'Content-type': 'application/json'});
    log(response.statusCode.toString());
    log(response.body.toString());
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      return ResponseData(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodeResponse);
    } else if (response.statusCode == 401) {
      return ResponseData(
          isSuccess: false, statusCode: response.statusCode, responseData: '');
    } else if (response.statusCode == 400) {
      return ResponseData(
          isSuccess: false, statusCode: response.statusCode, responseData: '');
    } else {
      return ResponseData(
          isSuccess: false, statusCode: response.statusCode, responseData: '');
    }
  }
}
