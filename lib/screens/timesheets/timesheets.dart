import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/widgets/app_list_view.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';
import '../../config/app_images.dart';
import '../../config/app_metrics.dart';
import '../../config/app_text_styles.dart';

class Timesheets extends StatefulWidget {
  @override
  _TimesheetsState createState() => _TimesheetsState();
}

class _TimesheetsState extends State<Timesheets> {
  List<String> items = new List.generate(5, (index) => 'Hello $index');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
        color: Colors.transparent,
        height: 90.0,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppMetrics.paddingHorizotal,
              vertical: AppMetrics.paddingVertical),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text("")),
              Expanded(
                  flex: 4,
                  child: Text(
                    "My ${AppTranslations().getLanguage(context, 'timesheets')}",
                    style: AppTextStyles.textSize16(),
                    textAlign: TextAlign.center,
                  )),
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  AppImage.notification,
                  alignment: Alignment.center,
                  height: 20.0,
                  width: 20.0,
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppMetrics.paddingHorizotal,
                vertical: AppMetrics.paddingVertical),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppImage.arrowcircleleft,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  width: 70,
                ),
                Text(
                  "April 2021",
                  style: AppTextStyles.textSize16(),
                ),
                SizedBox(
                  width: 70,
                ),
                SvgPicture.asset(
                  AppImage.arrowcircleright,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          CustomContainer(
            edgeInsets: EdgeInsets.only(
                top: 70.0,
                left: AppMetrics.paddingHorizotal,
                right: AppMetrics.paddingHorizotal),
            padding: EdgeInsets.only(top: AppMetrics.paddingContent),
            child: AppListView(
              data: items,
              renderItem: (item) {
                return renderItem(context, item);
              },
              onLoadMore: () {
                print('loadmore');
              },
            ),
          ),
        ],
      ),
      floatingActionButton: SvgPicture.asset(
        AppImage.floatbtn,
      ),
    );
  }

  Widget renderItem(BuildContext context, dynamic item) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Apr 12 - Apr 28 2021",
                  style: AppTextStyles.textSize16(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Schedule", style: AppTextStyles.textSize12()),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "40",
                          style: AppTextStyles.textSize16(
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Actual",
                          style: AppTextStyles.textSize12(),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "35.0",
                          style: AppTextStyles.textSize16(
                              fontWeight: FontWeight.bold,
                              color: AppColors.green),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                SvgPicture.asset(
                  AppImage.pending,
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppImage.paperclip,
                      fit: BoxFit.scaleDown,
                      width: 12.0,
                      height: 14.0,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "3",
                      style: AppTextStyles.textSize12(),
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
