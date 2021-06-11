import 'dart:ui';

import 'package:bookkeepa/blocs/business/business_bloc.dart';
import 'package:bookkeepa/models/leave/leave.dart';
import 'package:bookkeepa/screens/leave/edit_leave_request.dart';
import 'package:bookkeepa/screens/leave/new_leave_request.dart';
import 'package:bookkeepa/screens/leave/widgets/leave_balance.dart';
import 'package:bookkeepa/screens/notifications/notifications.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/app_list_view.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/float_btn.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:bookkeepa/widgets/overlay_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../config/app_colors.dart';
import '../../config/app_images.dart';
import '../../config/app_metrics.dart';
import '../../config/app_text_styles.dart';
import '../../util/navigator_serivce.dart';

class Leave extends StatefulWidget {
  @override
  _LeaveState createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  final formatStart = new DateFormat('dd MMM');
  final formatEnd = new DateFormat('dd MMM');
  List<LeaveModel> items = [];
  @override
  void initState() {
    BlocProvider.of<BusinessBloc>(context).add(FetchListLeave());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          child: HeaderChild(
              title: AppTranslations().getLanguage(context, 'myLeave'),
              style: AppTextStyles.textSize16(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.whiteColor
                      : AppColors.black),
              rightIcon: GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                      barrierDismissible: true,
                      barrierLabel: '',
                      barrierColor: Colors.black38,
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (ctx, anim1, anim2) {
                        return Notifications();
                      },
                      transitionBuilder: (ctx, anim1, anim2, child) =>
                          BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 30 * anim1.value, sigmaY: 30 * anim1.value),
                        child: FadeTransition(
                          child: child,
                          opacity: anim1,
                        ),
                      ),
                      context: context,
                    );
                  },
                  child: SvgPicture.asset(AppImage.notification)))),
      body: Column(
        children: [
          LeaveBalance(),
          Expanded(
            child: CustomContainer(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              edgeInsets:
                  EdgeInsets.symmetric(horizontal: AppMetrics.paddingHorizotal),
              padding:
                  EdgeInsets.symmetric(vertical: AppMetrics.paddingContent),
              colorBorder: AppColors.border,
              child: BlocBuilder<BusinessBloc, BusinessState>(
                builder: (context, state) {
                  if (state.businessRequesting) {
                    return OverlayLoading();
                  }
                  return AppListView(
                    data: state.leaveData,
                    renderItem: (item) {
                      return renderItem(context, item);
                    },
                    onLoadMore: () {
                      print('loadmore');
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomButton(
            ontap: () {
              NavigationService.instance.navigateTo(NewLeaveRequest());
            },
            borderColor: AppColors.greenAccent,
            color: AppColors.greenAccent,
            text: AppTranslations().getLanguage(context, 'requestLeave'),
            height: 55.0,
            width: MediaQuery.of(context).size.width * 0.4,
            style: AppTextStyles.textSize14(),
          ),
          SizedBox(
            width: 20.0,
          ),
          FancyFab()
        ],
      ),
    );
  }

  Widget renderItem(BuildContext context, LeaveModel item) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            NavigationService.instance.navigateTo(EditLeave());
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingContainer,
                vertical: AppMetrics.paddingContent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: AppTextStyles.textSize16(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColors.whiteColor
                                  : AppColors.black),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "${formatStart.format(item.startDate)} - ${formatEnd.format(item.endDate)}(${item.endDate.difference(item.startDate).inHours})",
                          style: AppTextStyles.textSize12(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColors.whiteColor
                                  : AppColors.greyColor),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          item.description,
                          style: AppTextStyles.textSize12(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColors.whiteColor
                                  : AppColors.black),
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        item.status == -1
                            ? SvgPicture.asset(
                                AppImage.rejected,
                                alignment: Alignment.center,
                              )
                            : item.status == 0
                                ? SvgPicture.asset(
                                    AppImage.pending,
                                    alignment: Alignment.center,
                                  )
                                : SvgPicture.asset(
                                    AppImage.approved,
                                    alignment: Alignment.center,
                                  ),
                        SizedBox(
                          height: 10.0,
                        ),
                        item.leaveType == "Annual Leave"
                            ? SvgPicture.asset(
                                AppImage.anual_leave,
                                alignment: Alignment.center,
                              )
                            : SvgPicture.asset(
                                AppImage.sick_leave,
                                alignment: Alignment.center,
                              ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        items.indexOf(item) == items.length - 1 ? Container() : Divider()
      ],
    );
  }
}
