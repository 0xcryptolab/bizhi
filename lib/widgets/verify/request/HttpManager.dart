import 'dart:convert';
import 'dart:io';

import 'SignConfig.dart';
import 'package:dio/dio.dart';
import 'dart:collection';

///http请求
class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static Map<String, String?> optionParams = {
    "mirrorToken": null,
    "content-Type": CONTENT_TYPE_JSON
  };

  //请求base url
  //todo 请求host配置
  static String baseUrl = "http://localhost:8999";
//   static late String baseUrl;

  ///发起网络请求
  ///[ url] 请求url
  ///[ param] 请求参数
  ///[ header] 外加头
  ///[ isNeedToken] 是否需要token
  ///[ optionMetod] 请求类型 post、get
  ///[ noTip] 是否需要返回错误信息 默认不需要
  ///[ needSign] 是否需要Sign校验  默认需要
  ///[ needError] 是否需要错误提示
  static requestData(url, param, Map<String, String>? header,
      {bool isNeedToken = true,
      String optionMetod = "post",
      noTip = false,
      needSign = true,
      needError = true}) async {
    ///初始化请求类
    Dio dio = Dio();

    ///头部
    Map<String, String> headers = HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    //请求协议 post 、get
    Options option = Options(method: optionMetod);

    ///设置头部
    option.headers = headers;

    option.sendTimeout = const Duration(seconds: 15);

    //获取token
    // var mirrorToken = "";

    // var params = param;
//    if (needSign) {
//      //获取加密的请求参数
//      params = await SignConfig.signData(param, mirrorToken);
//    }

    // try {
    //   var response =
    //       await dio.request("$baseUrl$url", data: params, options: option);
    // } catch (e) {
    //   return e;
    // }

    late Response response;
    try {
      response =
          // await dio.request("$baseUrl$url", data: params, options: option);
          await dio.post("$baseUrl$url",
              data: json.encode(param), options: option);
    } on DioError catch (e) {
      if (e.response != null) {
      } else {}

      if (needError) {
        return e;
      }
    }

    try {
      Map responseJson = jsonDecode(response.data);
      if (response.statusCode == 200) {
        ///请求链接成功
        return responseJson;
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
