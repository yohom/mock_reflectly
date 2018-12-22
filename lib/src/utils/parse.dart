import 'dart:convert';

import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:dio/dio.dart';

///
/// 响应中反序列化json
///
@deprecated
Map<String, dynamic> decode(Response response) {
  final Map jsonResponse = json.decode(response.data);
  L.d('响应: ' + jsonResponse.toString());
  return jsonResponse;
}

/// 抽取数组中的一个
Map<String, dynamic> single(Response response) {
  if (!response.data['error']) {
    return (response.data['results'] as List)[0];
  } else {
    throw response.data['message'];
  }
}

/// 抽取数组
List list(Response response) {
  if (!response.data['error']) {
    return (response.data['results'] as List);
  } else {
    throw response.data['message'];
  }
}
