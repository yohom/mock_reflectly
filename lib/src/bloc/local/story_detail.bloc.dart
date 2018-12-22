import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:meta/meta.dart';
import 'package:mock_reflectly/src/models/bean.export.dart';

import '../../di/injector.dart';
import '../../resources/remote/api.dart';

class StoryDetailBLoC extends LocalBLoC {
  @visibleForTesting
  static final Api api = Injector.obtain();

  StoryDetailBLoC() : super('Story详情 BLoC');

  @override
  List<BaseIO> get ioList => [showMoreOperate];

  Story data;

  /// 显示更多操作
  final showMoreOperate = IO<bool>(seedValue: false, isBehavior: true);
}
