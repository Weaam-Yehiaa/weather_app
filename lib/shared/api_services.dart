import 'package:dio/dio.dart';

class ApiService{
  // _ private kda kda m4 hast3mlha f 7ta bara
  final Dio _dio;

  ApiService(this._dio);
  Future<Map<String,dynamic>>get({
     String? url,
     Map<String,dynamic>? payload,

  })async{
    var response= await _dio.get(url!,queryParameters: payload);
    return response.data;
  }
}