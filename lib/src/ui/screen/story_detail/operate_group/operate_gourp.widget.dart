import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/bloc/bloc.export.dart';
import 'package:mock_reflectly/src/resources/resource.export.dart';
import 'package:mock_reflectly/src/ui/animation/fade_slide.transition.dart';
import 'package:mock_reflectly/src/ui/route/dialog.route.dart';
import 'package:mock_reflectly/src/ui/screen/story_detail/operate_group/operate.widget.dart';
import 'package:mock_reflectly/src/ui/screen/story_detail/operate_group/update_cover.widget.dart';
import 'package:rxdart/rxdart.dart';

/// 操作们
class OperateGroup extends StatelessWidget {
  const OperateGroup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _Exit(),
          Column(
            children: <Widget>[
              _More(),
              _Edit(),
              _UploadPicture(),
              _Delete(),
            ],
          ),
        ],
      ),
    );
  }
}

/// 退出
class _Exit extends StatelessWidget {
  const _Exit({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeSlideTransition(
      direction: SlideDirection.horizontal,
      originOffset: Offset(-100.0, 0.0),
      builder: (_, __) {
        return Operate(
          iconData: D.backBold,
          onTap: () => Navigator.pop(context),
          margin: EdgeInsets.only(left: kSpaceBig, top: kSpaceBig),
          quarterTurns: -1,
        );
      },
    );
  }
}

/// 显示更多
class _More extends StatelessWidget {
  const _More({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BLoCProvider.of<StoryDetailBLoC>(context);
    return FadeSlideTransition(
      direction: SlideDirection.horizontal,
      originOffset: Offset(100.0, 0.0),
      builder: (_, __) {
        return StreamBuilder<bool>(
          stream: bloc.showMoreOperate.stream,
          initialData: false,
          builder: (_, ss) {
            return Operate(
              iconData: ss.data ? D.closeBold : D.moreBold,
              onTap: () {
                bloc.showMoreOperate.add(!bloc.showMoreOperate.latest);
              },
              margin: EdgeInsets.only(
                right: kSpaceBig,
                top: kSpaceBig,
              ),
              quarterTurns: 1,
            );
          },
        );
      },
    );
  }
}

/// 编辑
class _Edit extends StatelessWidget {
  const _Edit({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BLoCProvider.of<StoryDetailBLoC>(context);
    return FadeSlideTransition(
      direction: SlideDirection.horizontal,
      immediately: false,
      originOffset: Offset(100.0, 0.0),
      builder: (_, controller) {
        return StreamBuilder<bool>(
          stream: bloc.showMoreOperate.stream,
          initialData: false,
          builder: (_, ss) {
            ss.data ? controller.forward() : controller.reverse();
            return Operate(
              iconData: D.write,
              onTap: () => Navigator.pushNamed(context, RoutePath.edit_story),
              margin: EdgeInsets.only(
                right: kSpaceBig,
                top: kSpaceBig,
              ),
            );
          },
        );
      },
    );
  }
}

/// 上传照片
class _UploadPicture extends StatelessWidget {
  const _UploadPicture({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BLoCProvider.of<StoryDetailBLoC>(context);
    return FadeSlideTransition(
      direction: SlideDirection.horizontal,
      immediately: false,
      originOffset: Offset(100.0, 0.0),
      builder: (_, controller) {
        return StreamBuilder<bool>(
          stream: bloc.showMoreOperate.stream,
          initialData: false,
          builder: (_, ss) {
            Observable.timer(null, Duration(milliseconds: 200)).listen(
                (_) => ss.data ? controller.forward() : controller.reverse());
            return Operate(
              iconData: D.editImage,
              onTap: () {
                bloc.showMoreOperate.add(!bloc.showMoreOperate.latest);
                showLightDialog(
                  context: context,
                  builder: (context) {
                    return UpdateCover(storyImage: bloc.data.storyImage);
                  },
                );
              },
              margin: EdgeInsets.only(
                right: kSpaceBig,
                top: kSpaceBig,
              ),
            );
          },
        );
      },
    );
  }
}

/// 删除
class _Delete extends StatelessWidget {
  const _Delete({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BLoCProvider.of<StoryDetailBLoC>(context);
    return FadeSlideTransition(
      direction: SlideDirection.horizontal,
      immediately: false,
      originOffset: Offset(100.0, 0.0),
      builder: (_, controller) {
        return StreamBuilder<bool>(
          stream: bloc.showMoreOperate.stream,
          initialData: false,
          builder: (_, ss) {
            Observable.timer(null, Duration(milliseconds: 400)).listen(
                (_) => ss.data ? controller.forward() : controller.reverse());
            return Operate(
              iconData: D.deleteBold,
              onTap: () {},
              margin: EdgeInsets.only(
                right: kSpaceBig,
                top: kSpaceBig,
              ),
            );
          },
        );
      },
    );
  }
}
