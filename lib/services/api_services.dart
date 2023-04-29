import 'dart:convert';
import 'package:dio/dio.dart';
import '../constants/api_constants.dart';
import '../exceptions/response_exception.dart';
import '../models/class_details.dart';
import 'http_error_handler.dart';

class ApiServices {
  final Dio dio = Dio();

  Future<ClassDetails> postClass(ClassDetails classDetails) async {
    try {
      final result = await dio.post(baseUrl + endPoint + keyApi,
          data: classDetails.toMap(),
          options: Options(
            method: 'POST',
            contentType: 'application/json',
          ));

      if (result.statusCode != 201) {
        throw httpErrorHandler(result);
      }

      final responseBody = json.decode(result.data);

      if (responseBody.isEmpty) {
        throw ResponseException('Cannot add data class to server');
      }

      final dataClass = ClassDetails.fromJson(responseBody);

      return dataClass;
    } catch (e) {
      rethrow;
    }
  }

  Future<ClassDetails> getClass() async {
    try {
      final result = await dio.get(baseUrl + endPoint + keyApi,
          options: Options(
            method: 'GET',
            contentType: 'application/json',
          ));

      if (result.statusCode != 200) {
        throw httpErrorHandler(result);
      }

      final responseBody = json.decode(result.data);

      if (responseBody.isEmpty) {
        throw ResponseException('Cannot add data class to server');
      }

      final dataClass = ClassDetails.fromJson(responseBody);

      return dataClass;
    } catch (e) {
      rethrow;
    }
  }
}
