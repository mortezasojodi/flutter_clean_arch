import 'package:dio/dio.dart';
import 'package:fluttertest/data/constants.dart';

class DioHelper {
  static Dio? dio;

  static String baseUrl = "";

  static Dio getDio() {
    if (null == dio) {
      dio = Dio();

    }
    return dio!;
  }
}

class Repository {
  Future<Response?> MsaPost(u,
      {Map<String, dynamic>? p,
      dynamic body,
      Map<String, dynamic>? header}) async {
    try {
      var response = await DioHelper.getDio().post(Urls.baseUrl + u,
          data: body,
          options: Options(
            headers: header,
          ));
      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        // logOut(Vzcontext());
      }
      if (e.response != null)
        throw DioError(response: e.response, requestOptions: e.requestOptions);
      throw Exception(Varriebles.error);
    }
  }

  Future<Response?> MsaGet(u,
      {Map<String, dynamic>? p, Object? body, header}) async {
    try {
      var response = await DioHelper.getDio().get(Urls.baseUrl + u,
          queryParameters: p,
          options: Options(
            headers: header,
          ));
      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        // logOut(Vzcontext());
      }
      if (e.response != null) return e.response;
      throw Exception(Varriebles.error);
      // Software caused connection abort
      //Software caused connection abort, errno = 103)
      //port:38576
    }
  }

  Future<Response?> MsaDelete(u,
      {Map<String, dynamic>? p, Object? body, header}) async {
    try {
      var response = await DioHelper.getDio().delete(Urls.baseUrl + u,
          data: body,
          options: Options(
            headers: header,
          ));
      return response;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        // logOut(Vzcontext());
      }
      if (e.response != null) return e.response;
      throw Exception(Varriebles.error);
    }
  }
}


class RepositoryNoServer {
  Future<Response?> MsaPost(u,
      {Map<String, dynamic>? p,
      Object? body,
      Map<String, dynamic>? header}) async {
    var response = await DioHelper.getDio().post(u,
        data: body,
        options: Options(
          headers: header,
        ));
    return response;
  }

  Future<Response?> MsaGet(u,
      {Map<String, dynamic>? p, Object? body, header}) async {
    var response = await DioHelper.getDio().get(u,
        queryParameters: p,
        options: Options(
          headers: header,
        ));
    return response;
  }
}


