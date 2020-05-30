import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tonal/common/constants.dart';
import 'package:tonal/common/entity/result_entity.dart';

export 'package:dio/dio.dart';

/*
1 固定请求地址, request URL 所有接口都是同一个
2 接口详解，apiCode区别各个接口，sign对请求加盐保密,白名单定义token是否需要传，params包裹传输数据
3 调用方式支持await异步,避免回调地狱
4 请求使用拦截器Interceptor处理各个部分
*/
class NetHelper {
  static const METHOD_GET = 'GET';
  static const METHOD_POST = 'POST';
  static const METHOD_PUT = 'PUT';
  static const METHOD_HEAD = 'HEAD';
  static const METHOD_DELETE = 'DELETE';
  static const METHOD_PATCH = 'PATCH';
  static const METHOD_DOWNLOAD = 'DOWNLOAD';

//  static const CONTENT_TYPE_JSON = 'application/json';
//  static const CONTENT_TYPE_FROM = 'application/x-www-form-urlencoded';
  static Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://www.google.com/api/",
      connectTimeout: 5000,

      ///  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
      ///  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
      ///  注意: 这并不是接收数据的总时限.
      receiveTimeout: 3000,
      headers: {},
    ),
  )..interceptors.addAll([
      LogsInterceptor(),
//      HeaderInterceptors(),
//      LogsInterceptors(),
//      ErrorInterceptors(),
//      ApiInterceptors(),
    ]);

  static Future<ResultEntity> get({
    @required String path,
    Map<String, String> params = const {},
    Options options,
    cancelToken,
    onSendProgress,
    onReceiveProgress,
  }) {
    return request(
      path: path,
      params: params,
      options: options..method = METHOD_GET,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  static Future<ResultEntity> post({
    @required String path,
    Map<String, String> params = const {},
    data,
    Options options,
    cancelToken,
    onSendProgress,
    onReceiveProgress,
  }) {
    return request(
      path: path,
      params: params,
      options: options..method = METHOD_POST,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

//  static Future<Response> request1({
//    @required String path,
//    params,
//    options,
//    cancelToken,
//    onSendProgress,
//    onReceiveProgress,
//  }) {
//    print('请求启动! url：$path ,params: $params');
//
//    try {
//      return _dio.request(
//        path,
//        queryParameters: params,
//        options: options,
//        cancelToken: cancelToken,
//        onSendProgress: onSendProgress,
//        onReceiveProgress: onReceiveProgress,
//      );
////      print('请求成功!response.data：${response.data}');
//    } on DioError catch (e) {
//      switch (e.type) {
//        case DioErrorType.CANCEL:
//          {
//            print('请求取消 ' + e.message);
//            break;
//          }
//        case DioErrorType.CONNECT_TIMEOUT:
//          {
//            print('请求超时 ' + e.message);
//            break;
//          }
//        case DioErrorType.SEND_TIMEOUT:
//          {
//            print('请求发送超时 ' + e.message);
//            break;
//          }
//        case DioErrorType.RECEIVE_TIMEOUT:
//          {
//            print('请求接收超时 ' + e.message);
//            break;
//          }
//        case DioErrorType.RESPONSE:
//          {
//            switch (e.response.statusCode) {
//              case 400:
//                {
//                  print('${e.response.statusCode} ' + '请求语法错误 ' + e.message);
//                }
//                break;
//              case 403:
//                {
//                  print('${e.response.statusCode} ' + '服务器拒绝执行 ' + e.message);
//                }
//                break;
//              case 404:
//                {
//                  print('${e.response.statusCode} ' + '无法连接服务器 ' + e.message);
//                }
//                break;
//              case 405:
//                {
//                  print('${e.response.statusCode} ' + '请求方法被禁止 ' + e.message);
//                }
//                break;
//              case 500:
//                {
//                  print('${e.response.statusCode} ' + '服务器内部错误 ' + e.message);
//                }
//                break;
//              case 502:
//                {
//                  print('${e.response.statusCode} ' + '无效的请求 ' + e.message);
//                }
//                break;
//              case 503:
//                {
//                  print('${e.response.statusCode} ' + '服务器挂了 ' + e.message);
//                }
//                break;
//              case 505:
//                {
//                  print('${e.response.statusCode} ' + '不支持HTTP请求 ' + e.message);
//                }
//                break;
//              default:
//                {
//                  print('${e.response.statusCode} ' + '服务器未知错误 ' + e.message);
//                }
//            }
//            break;
//          }
//        default:
//          {
//            print('请求未知错误 ' + e.message);
//          }
//      }
//    }
//  }

  static Future<ResultEntity> request({
    @required String path,
    params,
    options,
    cancelToken,
    onSendProgress,
    onReceiveProgress,
  }) async {
    print('请求启动! url：$path ,params: $params');
    Response response;

    try {
      response = await _dio.request(
        path,
        queryParameters: params,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      print('请求成功!response.data：${response.data}');
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.CANCEL:
          {
            print('请求取消 ' + e.message);
            break;
          }
        case DioErrorType.CONNECT_TIMEOUT:
          {
            print('请求超时 ' + e.message);
            break;
          }
        case DioErrorType.SEND_TIMEOUT:
          {
            print('请求发送超时 ' + e.message);
            break;
          }
        case DioErrorType.RECEIVE_TIMEOUT:
          {
            print('请求接收超时 ' + e.message);
            break;
          }
        case DioErrorType.RESPONSE:
          {
            switch (e.response.statusCode) {
              case 400:
                {
                  print('${e.response.statusCode} ' + '请求语法错误 ' + e.message);
                }
                break;
              case 403:
                {
                  print('${e.response.statusCode} ' + '服务器拒绝执行 ' + e.message);
                }
                break;
              case 404:
                {
                  print('${e.response.statusCode} ' + '无法连接服务器 ' + e.message);
                }
                break;
              case 405:
                {
                  print('${e.response.statusCode} ' + '请求方法被禁止 ' + e.message);
                }
                break;
              case 500:
                {
                  print('${e.response.statusCode} ' + '服务器内部错误 ' + e.message);
                }
                break;
              case 502:
                {
                  print('${e.response.statusCode} ' + '无效的请求 ' + e.message);
                }
                break;
              case 503:
                {
                  print('${e.response.statusCode} ' + '服务器挂了 ' + e.message);
                }
                break;
              case 505:
                {
                  print('${e.response.statusCode} ' + '不支持HTTP请求 ' + e.message);
                }
                break;
              default:
                {
                  print('${e.response.statusCode} ' + '服务器未知错误 ' + e.message);
                }
            }
            break;
          }
        default:
          {
            print('请求未知错误 ' + e.message);
          }
      }
    }
    return response.data;
  }
}

class LogsInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    if (Constants.IS_DEBUG) {
      print('request url: ${options.path}');
      print('request header: ${options.headers.toString()}');
      if (options.data != null) {
        print('request params: ${options.data.toString()}');
      }
      print('\r\n');
    }
    return options;
  }

  @override
  onResponse(Response response) async {
    if (Constants.IS_DEBUG) {
      if (response != null) {
        print('response: ${response.toString()}');
        print('\r\n');
      }
    }
    return response;
  }

  @override
  onError(DioError error) async {
    if (Constants.IS_DEBUG) {
      print('request error: ${error.toString()}');
      print('request error info: ${error.response?.toString() ?? ""}');
    }
    return error;
  }
}
