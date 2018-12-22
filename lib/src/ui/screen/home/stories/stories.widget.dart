import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/bloc/bloc.export.dart';
import 'package:mock_reflectly/src/models/bean.export.dart';
import 'package:mock_reflectly/src/ui/screen/home/stories/history_story.widget.dart';
import 'package:mock_reflectly/src/ui/screen/home/stories/intro.widget.dart';
import 'package:mock_reflectly/src/ui/screen/home/stories/new_story.widget.dart';

class Stories extends StatelessWidget {
  const Stories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BLoCProvider.of<HomeBLoC>(context);
    return SafeArea(
      child: PreferredFutureBuilder<List<Story>>(
        future: bloc.storyList.future,
        builder: (data) => _StoryPageView(data),
      ),
    );
  }
}

/// Stories的具体实现
class _StoryPageView extends StatefulWidget {
  final List<Story> storyList;

  _StoryPageView(this.storyList);

  @override
  _StoryListState createState() => _StoryListState();
}

class _StoryListState extends State<_StoryPageView> {
  final _controller = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    final bloc = BLoCProvider.of<HomeBLoC>(context);

    // 如果是手动按了返回按钮, 让PageView滚回第一页
    bloc.pageChange
        .where((pageChange) => pageChange.triggeredByBack)
        .listen((pageChange) {
      _controller.animateToPage(
        pageChange.page,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      );
    });

    return PageView.builder(
      controller: _controller,
      onPageChanged: (page) => bloc.pageChange.add(PageChange(page)),
      itemCount: widget.storyList.length + 2,
      itemBuilder: (context, index) {
        if (index == 0) return Intro();
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            double factor = 1.0;
            if (_controller.position.haveDimensions) {
              factor = _controller.page - index;
              factor = (1 - (factor.abs() * .2)).clamp(0.8, 1.0);
            }
            return Transform.scale(
              scale: Curves.easeOut.transform(factor),
              child: child,
            );
          },
          child: index == 1
              ? NewStory()
              : HistoryStory(story: widget.storyList[index - 2]),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
