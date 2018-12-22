import 'package:decorated_flutter/decorated_flutter.dart';

class AppBLoC extends RootBLoC {
  AppBLoC() : super('App全局BLoC');

  @override
  List<GlobalBLoC> get globalBLoCList => [];
}
