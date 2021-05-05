import 'package:bookkeepa/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppListView extends StatefulWidget {
  final List data;
  final Function onLoadMore;
  final Axis scrollDirection;
  final Function renderItem;

  const AppListView(
      {Key key,
      @required this.data,
      this.onLoadMore,
      this.scrollDirection = Axis.vertical,
      @required this.renderItem})
      : super(key: key);
  @override
  _AppListViewState createState() => _AppListViewState();
}

class _AppListViewState extends State<AppListView> {
  final _refreshController = RefreshController();
  ScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        physics: BouncingScrollPhysics(),
        controller: _refreshController,
        header: WaterDropMaterialHeader(),
        onRefresh: () {
          Future.delayed(const Duration(milliseconds: 1000), () {
            _refreshController.refreshCompleted();
          });
        },
        child: ListView.builder(
            scrollDirection: widget.scrollDirection,
            controller: controller,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index == widget.data.length) {
                return Center(
                  child: SpinKitThreeBounce(
                    color: AppColors.greenAccent,
                    size: 20.0,
                  ),
                );
              }
              return widget.renderItem(widget.data[index]);
            },
            itemCount: widget.data.length));
  }

  void _scrollListener() {
    double extentAfter = controller.position.extentAfter;
    if (widget.onLoadMore is Function && extentAfter < 500) {
      widget.onLoadMore();
    }
  }
}
