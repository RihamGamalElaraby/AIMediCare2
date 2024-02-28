import 'package:ai_medicare/Network/endPoints.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio(
    BaseOptions(
        baseUrl: BASEURL,
        receiveDataWhenStatusError: true,
        headers: {'Content-Type': 'application/json'}),
  );

  static Future<Response> getData({
    required path,
    Map<String, dynamic>? query,
    String token = '',
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.get(path, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    String token = '',
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
  // static Future<Response> getData({
  //   required String path,
  //   Map<String, dynamic>? query,
  //   Map<String, dynamic>? headers,
  // }) async {
  //   dio.options.headers = {
  //     'Content-Type': 'application/json',
  //     'User-Agent': 'PostmanRuntime/7.36.3',
  //     'Accept': '*/*',
  //     'Accept-Encoding': 'gzip, deflate, br',
  //     'Connection': 'keep-alive',
  //     ...(headers ?? {}), // Merge custom headers if provided
  //   };
  //   return await dio.get(path, queryParameters: query);
  // }

  // static Future<Response> postData({
  //   required String url,
  //   Map<String, dynamic>? query,
  //   required Map<String, dynamic> data,
  //   String? token, // Include token parameter here
  // }) async {
  //   dio.options.headers = {
  //     'Content-Type': 'application/json',
  //     'User-Agent': 'PostmanRuntime/7.36.3',
  //     'Accept': '*/*',
  //     'Accept-Encoding': 'gzip, deflate, br',
  //     'Connection': 'keep-alive',
  //     'Authorization': 'Bearer $token', // Include Bearer Token in headers
  //   };
  //   return dio.post(
  //     url,
  //     queryParameters: query,
  //     data: data,
  //   );
  // }
}

  // static Future<double> getBMI(
  //     {double? weight, double? height, String? token}) async {
  //   final Response response = await getData(
  //     path: '/api/patients/bmi',
  //     query: {'weight': 80, 'height': 170},
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization':
  //           'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZGNjYzA3OTYwZTlkNzZiZGEzOTM0OSIsImlhdCI6MTcwODk2OTAzMCwiZXhwIjoxNzE2NzQ1MDMwfQ.JM6jaPbwLDa_39fkilck42xWW0atNEyORDAZj7NWN9I',
  //     },
  //   );
  //   // Extract BMI from the response
  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> responseData = response.data;
  //     final double bmi = responseData['bmi'];
  //     return bmi;
  //   } else {
  //     print(response.data());
  //     throw Exception('Failed to get BMI');
  //   }
  // }

