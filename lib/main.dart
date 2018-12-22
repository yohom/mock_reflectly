import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/app.dart';
import 'package:mock_reflectly/src/di/injector.dart';

void main() {
  // DI
  Injector.setup(false);
  runApp(MockReflectlyApp());
}
