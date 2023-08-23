import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/error_message.dart';
import 'package:flutter_woo_commerce_getx_learn/common/routers/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/services/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/utils/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/values/index.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

class WPHttpService extends GetxService {
  static WPHttpService get to => Get.find<WPHttpService>();

  late final Dio _dio;

  @override
  void onInit() {
    super.onInit();
    var options = BaseOptions(
        baseUrl: Constants.wpApiBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: 'application/json; charset=utf-8',
        responseType: ResponseType.json);
    _dio = Dio(options);
    _dio.interceptors.add(RequestInterceptors());
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    return await _dio.get(url,
        queryParameters: params,
        options: requestOptions,
        cancelToken: cancelToken);
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.post(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future<Response> put(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.put(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  Future<Response> delete(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.delete(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }
}

class RequestInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // super.onRequest(options, handler);
    // if (UserService.to.hasToken) {
    //   options.headers['Authorization'] = 'Bearer ${UserService.to.token}';
    // }
    // http header 头加入 Authorization
    if (UserService.to.hasToken) {
      options.headers['Authorization'] = 'Bearer ${UserService.to.token}';
    }
    return handler.next(options);
    // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
    // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
    //
    // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
    // 这样请求将被中止并触发异常，上层catchError会被调用。
  }

  Future<void> _errorNoAuthLogout() async {
    Get.offAllNamed(RouteNames.systemRegisterPin);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode != 200 && response.statusCode != 201) {
      handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            response: response,
            type: DioExceptionType.badResponse,
          ),
          true);
    } else {
      handler.next(response);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = HttpException(err.message ?? "");
    switch (err.type) {
      case DioExceptionType.badResponse:
        {
          var response = err.response;
          final model = ErrorMessageModel.fromJson(response?.data);
          switch (model.statusCode) {
            case 401:
              _errorNoAuthLogout();
              break;
            case 404:
              break;
            case 500:
              break;
            case 502:
              break;
          }
          print("${err.message} ${err.requestOptions.path}");
          Loading.error(err.message);
        }
        break;
      case DioExceptionType.connectionTimeout:
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        break;
    }
    handler.next(err);
  }
}
