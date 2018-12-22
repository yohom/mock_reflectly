import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:mock_reflectly/src/models/bean.export.dart';

class Biz {
  static void checkAddStory(Story story) {
    if (isEmpty(story.title)) {
      throw '标题不能为空';
    } else if (isEmpty(story.storyDate)) {
      throw '时间不能为空';
    } else if (isEmpty(story.hero)) {
      throw '任务不能为空';
    } else if (isEmpty(story.storyContent)) {
      throw '事件不能为空';
    }
  }
}
