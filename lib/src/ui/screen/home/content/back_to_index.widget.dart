import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:mock_reflectly/src/bloc/local/home.bloc.dart';
import 'package:mock_reflectly/src/models/bean.export.dart';
import 'package:mock_reflectly/src/resources/resource.export.dart';

class BackToIndex extends StatelessWidget {
  const BackToIndex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BLoCProvider.of<HomeBLoC>(context);
    return SafeArea(
      child: PreferredStreamBuilder<PageChange>(
        // 只接受自然滑动事件, 因为自然滑动和手动返回的滑动会有一个值相同的事件产生
        // 用其中一个就可以了
        stream: bloc.pageChange.stream
            .where((pageChange) => !pageChange.triggeredByBack),
        initialData: PageChange(0),
        showLoading: false,
        builder: (data) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            transform: Matrix4.translationValues(
              data.page > 0 ? 0.0 : -100.0,
              0.0,
              0.0,
            ),
            child: IconButton(
              icon: Icon(D.back1, color: Colors.grey),
              onPressed: () {
                bloc.pageChange.add(PageChange(0, triggeredByBack: true));
              },
            ),
          );
        },
      ),
    );
  }
}
