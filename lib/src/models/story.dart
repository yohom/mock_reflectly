import 'dart:convert';

import 'package:mock_reflectly/src/utils/times.dart';

class Story {
  int id;
  String title;
  String storyContent;
  String storyImage;
  String storyDate;
  String hero;

  List<String> get formatStoryDate {
    final spiltDate = storyDate.split('-');
    final numberedMonth = spiltDate[1];
    final namedMonth = Times.numberMonth2NamedMonth(numberedMonth);
    return List()..add(spiltDate[2])..add(namedMonth)..add(spiltDate[0]);
  }

  Story({
    this.id,
    this.title,
    this.storyContent,
    this.storyImage,
    this.storyDate,
    this.hero,
  });

  Story.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    storyContent = json['storyContent'];
    storyImage = json['storyImage'];
    storyDate = json['storyDate'];
    hero = json['hero'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['storyContent'] = this.storyContent;
    data['storyImage'] = this.storyImage ??
        'https://i10.hoopchina.com.cn/hupuapp/bbs/81925600569265/thread_81925600569265_20180713134319_s_706810_o_w_1616_h_1080_29229.jpg?x-oss-process=image/resize,w_800/format,webp';
    data['storyDate'] = this.storyDate;
    data['hero'] = this.hero;
    return data;
  }

  String toJsonString() => jsonEncode(toJson());

  @override
  String toString() {
    return 'Login{id: $id, title: $title, storyContent: $storyContent, storyImage: $storyImage, storyDate: $storyDate, hero: $hero}';
  }
}
