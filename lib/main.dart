import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/app.dart';
import 'package:mock_reflectly/src/di/injector.dart';
import 'package:mock_reflectly/src/resources/resource.export.dart';

void main() {
  // DI
  Injector.setup(false);
  // http 工具
  HttpUtils.init(BASE_URL);
  runApp(MockReflectlyApp());
}
