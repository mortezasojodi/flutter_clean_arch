import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertest/data/api/requests.dart';
import 'package:fluttertest/data/constants.dart';
import 'package:fluttertest/data/network/api_request_representable.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 25);
  // final _client = GetConnect(timeout: requestTimeOut);

  static final _singleton = APIProvider();
  static APIProvider get instance => _singleton;

  Future request(APIRequestRepresentable request) async {
    try {
      Response<dynamic>? response = null;
      switch (request.method) {
        case HTTPMethod.get:
          try {
            response = await DioHelper.getDio().get(request.url + request.path,
                queryParameters: request.query,
                options: Options(
                  headers: request.headers,
                ));
            return _returnResponse(response);
          } on DioError catch (e) {
            if (e.response?.statusCode == 401) {
              // bzPushNamedAndRemoveUntil(AppRoutes.Login, null);
            }
            if (e.response != null) return _returnResponse(e.response!);

            throw Exception(Varriebles.error);
          }

        case HTTPMethod.post:
          try {
            var response =
                await DioHelper.getDio().post(request.url + request.path,
                    data: request.body,
                    options: Options(
                      headers: request.headers,
                    ));
            return _returnResponse(response);
          } on DioError catch (e) {
            if (e.response?.statusCode == 401) {
              // logOut(Vzcontext());
            }
            if (e.response != null) return _returnResponse(e.response!);
            throw Exception(Varriebles.error);
          }
        case HTTPMethod.delete:
          try {
            var response =
                await DioHelper.getDio().delete(request.url + request.path,
                    data: request.body,
                    options: Options(
                      headers: request.headers,
                    ));
            return response;
          } on DioError catch (e) {
            if (e.response?.statusCode == 401) {
              // logOut(Vzcontext());
            }
            if (e.response != null) return e.response;
            throw Exception(Varriebles.error);
          }
        case HTTPMethod.put:
          try {
            var response =
                await DioHelper.getDio().put(request.url + request.path,
                    data: request.body,
                    options: Options(
                      headers: request.headers,
                    ));
            return response;
          } on DioError catch (e) {
            if (e.response?.statusCode == 401) {
              // logOut(Vzcontext());
            }
            if (e.response != null) return e.response;
            throw Exception(Varriebles.error);
          }
        default:
      }
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
      //create
      case 201:
      //update
      //delete
      case 204:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

class AppException implements Exception {
  final code;
  final message;
  final details;

  AppException({this.code, this.message, this.details});

  String toString() {
    return "[$code]: $message \n $details";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
      : super(
          code: "fetch-data",
          message: "Error During Communication",
          details: details,
        );
}

class BadRequestException extends AppException {
  BadRequestException(String? details)
      : super(
          code: "invalid-request",
          message: "Invalid Request",
          details: details,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String? details)
      : super(
          code: "unauthorised",
          message: "Unauthorised",
          details: details,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException(String? details)
      : super(
          code: "invalid-input",
          message: "Invalid Input",
          details: details,
        );
}

class AuthenticationException extends AppException {
  AuthenticationException(String? details)
      : super(
          code: "authentication-failed",
          message: "Authentication Failed",
          details: details,
        );
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: "request-timeout",
          message: "Request TimeOut",
          details: details,
        );
}
