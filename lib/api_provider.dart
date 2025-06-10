import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';
import 'dart:async';

class DioClient extends Openapi{
  // static final DioClient _singleton = DioClient._internal();
  // late final Dio _dio;
  final int _maxRetryAttempts = 3;

  DioClient(): super(basePathOverride: "http://192.168.0.254:8080"){
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        debugPrint('Requesting: ${options.method} ${options.uri}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint('Response received from ${response.requestOptions.uri}');
        return handler.next(response);
      },
      onError: (DioException exception, handler) async {
        if (_shouldRetry(exception)) {
          await retryRequest(exception, handler);
        } 
        else if (exception.type == DioExceptionType.badResponse){
          if(exception.response!.statusCode == 400){
            handler.reject(exception);
          }
        }
        else {
          _handleException(exception);
          return handler.next(exception);
        }
      },
    ));
  }


  // // Public factory constructor for singleton
  // factory DioClient() => _singleton;


  // Retry Logic
  bool _shouldRetry(DioException exception) {
    return exception.type == DioExceptionType.connectionTimeout ||
        exception.type == DioExceptionType.receiveTimeout;
  }

  Future<void> retryRequest(DioException exception, ErrorInterceptorHandler handler) async {
    final requestOptions = exception.requestOptions;
    int retryCount = requestOptions.extra['retryCount'] ?? 0;

    if (retryCount < _maxRetryAttempts) {
      requestOptions.extra['retryCount'] = retryCount + 1;
      try {
        final response = await dio.fetch(requestOptions);
        return handler.resolve(response);
      } catch (e) {
        return handler.reject(e as DioException);
      }
    }
  }

  // Error Handling
  void _handleException(DioException exception) {
    if (exception.type == DioExceptionType.connectionTimeout) {
      debugPrint('Connection timeout occurred');
    } else if (exception.type == DioExceptionType.receiveTimeout) {
      debugPrint('Receive timeout occurred');
    } else if (exception.response != null) {
      switch (exception.response?.statusCode) {
        case 400:
          debugPrint('Bad request: ${exception.response?.data}');
          break;
        case 401:
          debugPrint('Unauthorized: ${exception.response?.data}');
          break;
        case 403:
          debugPrint('Forbidden: ${exception.response?.data}');
          break;
        case 404:
          debugPrint('Not found: ${exception.response?.data}');
          break;
        case 500:
          debugPrint('Internal server error');
          break;
        default:
          debugPrint('Invalid status code: ${exception.response?.statusCode}');
      }
    } else {
      debugPrint('Unexpected error: ${exception.message}');
    }
  }
}

// final apiClient = Openapi(basePathOverride: "http://192.168.0.254:8080", interceptors: interceptors);

final apiClient = DioClient();
