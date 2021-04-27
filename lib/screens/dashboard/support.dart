import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/models/account/support.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/app_list_view.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  List<SupportModel> items = [
    SupportModel(
        issender: false,
        message: "I need help creating an invoice",
        time: "3:00pm"),
    SupportModel(
        issender: true,
        message:
            "You can create a new invoice by tapping n the plus bottom on the corner right of your screen. This will open menu withe the open to create a new invoice",
        time: "3:10pm"),
    SupportModel(
        issender: false, message: "Thank for your help", time: "3:15pm"),
    SupportModel(
        issender: true,
        message:
            "Your're welcome. if You have anymore question, please feel free to send me a message anytime. \n\nThanks \nZoey",
        time: "3:20pm"),
    SupportModel(
        issender: false, message: "Thank for your help", time: "3:15pm"),
    SupportModel(
        issender: true,
        message:
            "Your're welcome. if You have anymore question, please feel free to send me a message anytime. \n\nThanks \nZoey",
        time: "3:20pm"),
  ];
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
                children: [
                  Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          NavigationService.instance.goback();
                        },
                        child: SvgPicture.asset(
                          AppImage.arrow_back,
                          height: 21.0,
                          width: 11.0,
                        ),
                      )),
                  Expanded(
                      flex: 9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Support',
                            style: AppTextStyles.textSize16(),
                          )
                        ],
                      )),
                  Expanded(flex: 1, child: Text(''))
                ],
              ),
            )),
        body: Container(
          margin: EdgeInsets.only(bottom: 80.0),
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
        floatingActionButton: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              margin: EdgeInsets.only(left: 50.0),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey.withOpacity(0.2)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppMetrics.borderButton)),
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: AppMetrics.paddingHorizotal,
                        vertical: AppMetrics.paddingVertical),
                    hintText: "Say something...",
                    hintStyle: AppTextStyles.textSize16()),
              ),
            ),
            SvgPicture.asset(
              AppImage.floatbtn,
            ),
          ],
        ));
  }

  Widget renderItem(BuildContext context, SupportModel item) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppMetrics.paddingHorizotal,
          vertical: AppMetrics.paddingContent),
      child: Row(
        mainAxisAlignment:
            item.issender ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!item.issender)
            Image.asset(
              AppImage.avatar,
            ),
          if (!item.issender)
            SizedBox(
              width: 10.0,
            ),
          Flexible(
              child: Column(
            mainAxisAlignment:
                item.issender ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: item.issender
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingHorizotal,
                    vertical: AppMetrics.paddingVertical),
                margin: item.issender
                    ? EdgeInsets.only(left: 50.0)
                    : EdgeInsets.only(right: 50.0),
                decoration: BoxDecoration(
                    color:
                        item.issender ? AppColors.whiteColor : AppColors.green,
                    borderRadius:
                        BorderRadius.circular(AppMetrics.borderContainer)),
                child: Text(
                  item.message,
                  style: AppTextStyles.textSize16(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  item.time,
                  style: AppTextStyles.textSize12(),
                ),
              )
            ],
          )),
          if (item.issender)
            SizedBox(
              width: 10,
            ),
          if (item.issender)
            Image.asset(
              AppImage.avatar,
            )
        ],
      ),
    );
  }
}
