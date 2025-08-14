import 'dart:convert';
import 'package:app/common_lib.dart';
import 'package:app/core/utils/snackbar.dart';
import 'package:app/data/services/_clients.dart';
import 'package:flutter/foundation.dart';

/// Error interceptor component
/// Handles different types of Dio errors and provides standardized error responses
class ErrorInterceptor extends Interceptor {
  final VoidCallback? on401Error;

  ErrorInterceptor({this.on401Error});
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      if (on401Error != null) {
        on401Error!();
      }
    }
    switch (err.type) {
      case DioExceptionType.badCertificate:
        Utils.showErrorSnackBar("حدث خطأ ما");
        break;
      case DioExceptionType.badResponse:
        debugPrint(err.error.toString());
        String message = "حدث خطأ ما";
        if (err.error is FormatException) {
          message = err.error.toString().replaceRange(0, 54, "").replaceAll("^", "").replaceAll("\n", "");
        } else if (err.response?.data is String) {
          message = err.response?.data;
        } else if (err.response?.data['message'] != null) {
          message = err.response?.data['message'];
        }
        Utils.showErrorSnackBar(message);
        break;
      case DioExceptionType.cancel:
        debugPrint(err.message);
        break;
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        Utils.showErrorSnackBar("حدث خطأ في الاتصال");
        break;
      case DioExceptionType.unknown:
        String message = "حدث خطأ ما";
        if (err.error is FormatException) {
          message = err.error.toString().replaceRange(0, 54, "").replaceAll("^", "");
        } else {
          final data = err.response?.data;
          if (data is Map<String, dynamic>) {
            message = data['message'] ?? message;
          } else if (data is String) {
            message = json.decode(json.encode(data));
          }
        }
        final parsedResponse = Response(
          requestOptions: err.requestOptions,
          data: {"data": {}, "message": message, "statusCode": 400},
          statusMessage: err.message,
        );
        Utils.showErrorSnackBar(message);
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            response: parsedResponse,
            error: message,
            type: DioExceptionType.unknown,
          ),
        );
        return;
    }
    handler.next(err);
  }
}
