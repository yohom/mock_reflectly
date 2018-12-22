import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:meta/meta.dart';
import 'package:mock_reflectly/src/di/injector.dart';
import 'package:mock_reflectly/src/models/bean.export.dart';
import 'package:mock_reflectly/src/resources/remote/api.dart';

class HomeBLoC extends LocalBLoC {
  @visibleForTesting
  final Api api = Injector.obtain();

  HomeBLoC() : super('首页 BLoC');

  @override
  List<BaseIO> get ioList => [pageChange];

  /// page切换事件
  /// int泛型代表当前是第几页, bool表示是否是按了回到第一页的按钮
  final pageChange = IO<PageChange>(isBehavior: true);

  final storyList = Output<List<Story>>(
    semantics: 'story列表',
    trigger: () => Api().fetchStoryList({}),
  );
}
