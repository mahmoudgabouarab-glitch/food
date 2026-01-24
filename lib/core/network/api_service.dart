import 'package:dio/dio.dart';
import 'package:food/core/network/cache_helper.dart';
import 'package:food/core/network/cache_keys.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServise {
  final String _baseurl = "https://sonic-zdi0.onrender.com/api/";
  final Dio _dio;
  ApiServise(this._dio) {
    _dio.options.headers = {"Accept": "application/json"};
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = CacheHelper.getDataString(key: CacheKeys.token);
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  Future<Map<String, dynamic>> get({
    required String endpoint,
    Options? options,
  }) async {
    var response = await _dio.get("$_baseurl$endpoint", options: options);

    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    dynamic postData = data;
    if (data is Map<String, dynamic>) {
      bool hasFile = data.values.any((v) => v is MultipartFile);
      if (hasFile) {
        postData = FormData.fromMap(data);
      }
    }
    final response = await _dio.post(
      "$_baseurl$endpoint",
      data: postData,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
