import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:dio/dio.dart';
import 'package:mock_reflectly/src/models/bean.export.dart';
import 'package:mock_reflectly/src/resources/resource.export.dart';
import 'package:mock_reflectly/src/utils/parse.dart';

class Api {
  static Api _instance;

  Api._();

  factory Api() {
    if (_instance == null) {
      _instance = Api._();
      return _instance;
    } else {
      return _instance;
    }
  }

  /// 获取story列表
  Future<List<Story>> fetchStoryList(Map<String, dynamic> data) {
    return _dio
        .get('/story')
        .then(list)
        .then((list) => list.map((map) => Story.fromJson(map)).toList());
  }

  /// 新增story
  Future<Bean> addStory(Map<String, dynamic> data) {
    return _dio
        .post('/add_story', data: data)
        .then((bean) => Bean.fromJson(bean.data));
  }
}

final _dio = Dio()
  ..options.baseUrl = BASE_URL
  ..interceptor.request.onSend = (options) {
    L.p(HttpUtils.map2Url(options.data, path: options.path));
    return options;
  }
  ..interceptor.response.onSuccess = (response) {
    L.p(response.toString());
    return response;
  }
  ..interceptor.response.onError = (error) {
    L.p('请求错误: ${error.message}');
    return error;
  };
