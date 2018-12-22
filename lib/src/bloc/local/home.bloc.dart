import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:mock_reflectly/src/models/bean.export.dart';

class HomeBLoC extends LocalBLoC {
  /// page切换事件
  /// int泛型代表当前是第几页, bool表示是否是按了回到第一页的按钮
  final pageChange = IO<PageChange>(isBehavior: true);

  @override
  List<BaseIO> get ioList => [pageChange];
}
