
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart' as d;

enum DioType { post, get, put, delete }

Future<d.Options> defaultHeader() async {
  // tokenDevice = await FirebaseMessaging.instance.getToken();
  return d.Options(headers: {
    "Content-Type": "application/json",
    "actiontrak-app-token": '',
  });
}

Future<d.Options> haveAuthorization() async {
  const tokenDevice = '';
  const token = '';
  //log("$token");
  return d.Options(headers: {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token",
    "actiontrak-app-token": tokenDevice,
  });
}

class DioMethod {
  static final dio = d.Dio();

  static Future<d.Response> methodData({
    required DioType type,
    required String path,
    required bool isAuth,
    bool? isZipToken,
    bool? isPayment,
    bool? isZipPayment,
    File? file,
    dynamic data,
    dynamic queryparameters,
    d.Dio? client,
  }) async {
    final authenticated = isAuth == true
        ? await haveAuthorization()
        : await defaultHeader();
    final vios = client ?? dio;
    try {
      switch (type) {
        case DioType.post:
          final response = await vios.post(
            path,
            data: data,
            options: authenticated,
            queryParameters: queryparameters,
          );
          return response;

        case DioType.put:
          final response = await vios.put(
            path,
            data: data,
            queryParameters: queryparameters,
            options: authenticated,
          );
          return response;
        case DioType.get:
          final response = await vios.get(
            path,
            queryParameters: data,
            options: authenticated,
          );
          return response;
        case DioType.delete:
          final response = await vios.delete(path,
              data: data,
              options: authenticated,
              queryParameters: queryparameters);
          return response;
      }
    } on d.DioException catch (e) {
      log("${e.message}\nAPI\n$path",
          error: "API ERROR CALL", name: "API CALL EXCEPTION");

      return e.response!;
    }
  }
}
