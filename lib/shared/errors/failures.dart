import 'package:dio/dio.dart';

abstract class Failure{
  final String errorMessage;

  Failure(this.errorMessage);
}
class ServerFailure extends Failure{
  // super constructor l2no by-extend
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioError dioError)
  {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int statusCode,dynamic response)
  {
    if(statusCode==400||statusCode==401||statusCode==403)
    {
      return ServerFailure(response['error']['message']);
    }else if(statusCode==404){
      return ServerFailure('Your request not found,Please try again later');
    }
    else if(statusCode==500){
      return ServerFailure('Internet Server error,Please try again later');
    }
    else{
      return ServerFailure('Ops There was an Error,Please Try again later');
    }
  }

}