import 'package:base/app/exceptions.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static String get _baseUrl => 'https://...';

  static String get baseUrlStorage => 'https://...';

  static final Dio _client = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      validateStatus: (status) => true,
    ),
  );

  static Future get(String endpoint, {Map<String, dynamic>? headers, CancelToken? cancelToken}) async {
    try {
      Response response = await _client
          .get(
            endpoint,
            cancelToken: cancelToken,
            options: Options(headers: headers, responseType: ResponseType.json),
          )
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return response.data;
      }
      throw (response);
    } catch (e) {
      if (e is Response) {
        throw (_getExceptionFromResponce(e));
      }
      throw (NetworkException("No Internet"));
    }
  }

  static Future post(String endpoint, {dynamic data, Map<String, dynamic>? headers, CancelToken? cancelToken}) async {
    try {
      Response response = await _client
          .post(
            endpoint,
            data: data,
            cancelToken: cancelToken,
            options: Options(headers: headers, responseType: ResponseType.json),
          )
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return response.data;
      }
      throw (response);
    } catch (e) {
      if (e is Response) {
        throw (_getExceptionFromResponce(e));
      }
      throw (NetworkException("No Internet"));
    }
  }

  static Future delete(String endpoint, {dynamic data, Map<String, dynamic>? headers, CancelToken? cancelToken}) async {
    try {
      Response response = await _client
          .post(
            endpoint,
            data: data,
            cancelToken: cancelToken,
            options: Options(headers: headers, responseType: ResponseType.json),
          )
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        return response.data;
      }
      throw (response);
    } catch (e) {
      if (e is Response) {
        throw (_getExceptionFromResponce(e));
      }
      throw (NetworkException("No Internet"));
    }
  }

  static Exception _getExceptionFromResponce(Response resp) {
    if (resp.data is Map<String, dynamic>) {
      if ((resp.data as Map<String, dynamic>).containsKey("message")) {
        return NetworkException(resp.data["message"]);
      } else {
        return NetworkException("Something went wrong");
      }
    } else {
      return NetworkException(resp.data.toString());
    }
  }
}
