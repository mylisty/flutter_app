import 'dart:convert';
import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';


/// 请求方式
enum RequestMethod {
  get,
  head,
  post,
  put,
  delete,
  patch,
}

/// 请求格式
enum RequestContentType {
  json,
  form,
}

/// 认证类型
enum AuthType {
  none,
  basic,
  token,
}

enum HandleErrorType {
  /// 正常toast
  normal,

  /// 忽略(eg:上报位置信息, 退出登录)
  ignore,
}

class HttpBaseUtil {
  factory HttpBaseUtil() => _httpBaseUtil;
  static const int CONNECT_TIME_OUT = 20000;
  static const int RECEIVE_TIME_OUT = 10000;

  /// 单例
  static final HttpBaseUtil _httpBaseUtil = HttpBaseUtil._init();

  HttpBaseUtil._init() {
    if (_dio == null) {
      BaseOptions baseOptions = BaseOptions();
      baseOptions.connectTimeout = CONNECT_TIME_OUT;
      baseOptions.receiveTimeout = RECEIVE_TIME_OUT;
      _dio = Dio(baseOptions);

    }
  }



  /// 实例
  Dio _dio;

  Dio get dio {
    return _dio;
  }

  Future<BaseResponse> request(context,
      {@required String url,
      RequestMethod method = RequestMethod.get,
      RequestContentType contentType = RequestContentType.json,
      AuthType authType = AuthType.token,
      HandleErrorType handleErrorType = HandleErrorType.normal,
      data,
      Map<String, dynamic> queryParameters,
      CancelToken cancelToken,
      Options options}) async {
    options = options ?? Options();

    /// 配置method
    switch (method) {
      case RequestMethod.get:
        options.method = 'GET';
        break;
      case RequestMethod.head:
        options.method = 'HEAD';
        break;
      case RequestMethod.post:
        options.method = 'POST';
        break;
      case RequestMethod.put:
        options.method = 'PUT';
        break;
      case RequestMethod.patch:
        options.method = 'PATCH';
        break;
      case RequestMethod.delete:
        options.method = 'DELETE';
        break;
      default:
        break;
    }

    /// 配置请求类型
    if (contentType == RequestContentType.form) {
      options.contentType =
          ContentType.parse('application/x-www-form-urlencoded') as String;
    }

    /// 配置统一header
    // options.headers['application'] = 'app_threeguarantees';
    /// 发起请求
    BaseResponse baseResponse;
    try {
      Response response = await _dio.request(url,
          data: data,
          queryParameters: queryParameters,
          cancelToken: cancelToken,
          options: options);
      print("----> " +response.toString());
      if (response.statusCode >= 200 && response.statusCode < 300) {
        /// 成功逻辑
        baseResponse = BaseResponse(success: true, res: response.data);
      } else {
        /// 失败逻辑
        int errorCode = -1;
        String errorMessage = '网络请求失败, 请稍后重试：E101';
        String errors = "";

        if (response.statusCode == 401) {
          errorCode = 401;
          errorMessage = "登录信息过期";
          // token 失效时 退出
          //     RouteUtil.pushPageWithNoContext("/login");

        }else {
          if (response != null) {
            if (response.data is String) {
              errorCode = -1;
              errorMessage = response.data;
            } else if (response.data is Map) {
              errorCode = response.data['code'] ?? -1;
              errorMessage = response.data['message'] ?? '网络请求失败, 请稍后重试：E102';
              errors = response.data["errors"];
            }
          }
        }
        baseResponse = BaseResponse(
          success: false,
          errorResponse: ErrorResponse(
            context: context,
            statusCode: response.statusCode ?? -1,
            errorCode: errorCode,
            errorMessage: errorMessage,
            response: response,
          ),
        );
      }
    } on DioError catch (error) {
      dynamic errorCode = -1;
      print(error.toString());
      String errorMessage = '网络请求失败, 请稍后重试：E103';

      if (error.response != null && error.response.statusCode == 401) {
        errorCode = error.response.data['code'] ?? -1;
        errorMessage = (error.response.data['message'] ?? error.message) ??
            '网络请求失败, 请稍后重试：E104';
        // token 失效时 退出
      //     RouteUtil.pushPageWithNoContext("/login");
      }else {
        if (error.response != null) {
          if (error.response.data is String) {
            errorCode = -1;
            errorMessage = error.response.data;
          } else if (error.response.data is Map) {
            errorCode = error.response.data['code'] ?? -1;
            errorMessage = (error.response.data['message'] ?? error.message) ??
                '网络请求失败, 请稍后重试：E104';
          }
          errorCode = error.response.statusCode ?? -1;
        }
      }

      baseResponse = BaseResponse(
        success: false,
        errorResponse: ErrorResponse(
          context: context,
          statusCode: errorCode,
          errorCode: errorCode,
          errorMessage: errorMessage,
          response: error.response,
        ),
      );
    }
    return baseResponse;
  }
}

/// 网络请求返回的基类
class BaseResponse {
  // 是否成功
  final bool success;

  // 返回的信息
  dynamic res;

  ErrorResponse errorResponse;

  BaseResponse({@required this.success, this.res, this.errorResponse});
}

/// 失败基类
class ErrorResponse {
  final BuildContext context;
  final dynamic statusCode;
  final dynamic errorCode;
  final String errorMessage;
  final Response response;

  ErrorResponse({
    @required this.context,
    @required this.statusCode,
    this.errorCode,
    @required this.errorMessage,
    @required this.response,
  });
}
