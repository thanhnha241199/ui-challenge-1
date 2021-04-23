import 'package:bookkeepa/widgets/app_list_view.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationState createState() => new _NotificationState();
}

class _NotificationState extends State<Notifications> {
  List<String> items = new List.generate(100, (index) => 'Hello $index');

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SafeArea(
            child: AppListView(
      data: items,
      renderItem: (item) {
        return renderItem(context, item);
      },
      onLoadMore: () {
        print('loadmore');
      },
    )));
  }

  Widget renderItem(BuildContext context, dynamic item) {
    return Text(item);
  }
}
