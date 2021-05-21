import 'package:bookkeepa/config/app_colors.dart';
import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_metrics.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/models/business/business.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/blocs/business/business_bloc.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/header_view.dart';
import 'package:bookkeepa/widgets/overlay_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectBusiness extends StatefulWidget {
  @override
  _SelectBusinessState createState() => _SelectBusinessState();
}

class _SelectBusinessState extends State<SelectBusiness> {
  List<BusinessModel> items = [];
  int selected = 0;
  @override
  void initState() {
    BlocProvider.of<BusinessBloc>(context).add(FetchBusiness());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          child: HeaderChild(
              title: AppTranslations().getLanguage(context, 'selectBusiness'),
              style: AppTextStyles.textSize16(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.whiteColor
                      : AppColors.black),
              leftIcon: SvgPicture.asset(AppImage.arrow_back))),
      body: BlocBuilder<BusinessBloc, BusinessState>(
        builder: (context, state) {
          if (state.businessRequesting) {
            return OverlayLoading();
          }
          if (state.businessSuccess) {
            items = state.businessData;
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      ..._getBody(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppMetrics.paddingHorizotal,
                        vertical: AppMetrics.paddingVertical),
                    child: CustomButton(
                      ontap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          builder: (BuildContext context) {
                            return Container(
                              padding: EdgeInsets.only(top: 30.0),
                              height: MediaQuery.of(context).size.height * 0.55,
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: Text("")),
                                        Expanded(
                                            flex: 5,
                                            child: Text(
                                              "Are you sure you want \nto switch to bussiness?",
                                              textAlign: TextAlign.center,
                                              style: AppTextStyles.textSize20(
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context)
                                                              .brightness ==
                                                          Brightness.dark
                                                      ? AppColors.whiteColor
                                                      : AppColors.black),
                                            )),
                                        Expanded(
                                            child: GestureDetector(
                                                onTap: () {
                                                  NavigationService.instance
                                                      .goback();
                                                },
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 24.0),
                                                  child: SvgPicture.asset(
                                                    AppImage.close,
                                                    alignment: Alignment.center,
                                                  ),
                                                )))
                                      ],
                                    ),
                                    SizedBox(
                                      height: AppMetrics.paddingContent,
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.only(
                                          right: AppMetrics.paddingHorizotal,
                                          left: AppMetrics.paddingHorizotal,
                                          top: AppMetrics.paddingContainer,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                AppMetrics.paddingContainer,
                                            horizontal:
                                                AppMetrics.paddingContainer),
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).brightness ==
                                                        Brightness.dark
                                                    ? AppColors.black300
                                                    : AppColors.whiteColor,
                                            border: Border.all(
                                                color: AppColors.border),
                                            borderRadius: BorderRadius.circular(
                                                AppMetrics.borderContainer)),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 62,
                                              width: 62,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                AppImage.business,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 28.0,
                                            ),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    items[selected].name,
                                                    style: AppTextStyles.textSize18(
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? AppColors
                                                                .whiteColor
                                                            : AppColors.black),
                                                  ),
                                                  Text(
                                                    "Address Infor (get from Xero)",
                                                    style: AppTextStyles.textSize14(
                                                        color: Theme.of(context)
                                                                    .brightness ==
                                                                Brightness.dark
                                                            ? AppColors
                                                                .whiteColor
                                                            : AppColors.black),
                                                  )
                                                ]),
                                          ],
                                        )),
                                    SizedBox(
                                      height: 36.0,
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  AppMetrics.paddingHorizotal),
                                          child: CustomButton(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08,
                                            ontap: () {
                                              NavigationService.instance
                                                  .goback();
                                            },
                                            borderColor: AppColors.greenAccent,
                                            color: AppColors.greenAccent,
                                            text: "Yes",
                                            style: AppTextStyles.textSize14(),
                                          ),
                                        ),
                                        SizedBox(
                                          height: AppMetrics.paddingContainer,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  AppMetrics.paddingHorizotal),
                                          child: CustomButton(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08,
                                            ontap: () {
                                              NavigationService.instance
                                                  .goback();
                                            },
                                            borderColor: AppColors.greenAccent,
                                            color: AppColors.whiteColor,
                                            text: "No",
                                            style: AppTextStyles.textSize14(),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: AppMetrics.paddingContainer,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      borderColor: AppColors.greenAccent,
                      color: AppColors.greenAccent,
                      text: AppTranslations()
                          .getLanguage(context, 'changeBusiness'),
                      height: MediaQuery.of(context).size.height * 0.08,
                      style: AppTextStyles.textSize16(),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  _getBody() {
    return items.map((e) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selected = items.indexOf(e);
          });
        },
        child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              right: AppMetrics.paddingHorizotal,
              left: AppMetrics.paddingHorizotal,
              top: AppMetrics.paddingContainer,
            ),
            padding: EdgeInsets.symmetric(
                vertical: AppMetrics.paddingContainer,
                horizontal: AppMetrics.paddingContainer),
            decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.black300
                    : AppColors.whiteColor,
                border: Border.all(
                    color: selected == items.indexOf(e)
                        ? AppColors.greenAccent
                        : Theme.of(context).brightness == Brightness.dark
                            ? AppColors.black300
                            : AppColors.border),
                borderRadius:
                    BorderRadius.circular(AppMetrics.borderContainer)),
            child: Row(
              children: [
                Container(
                  height: 62,
                  width: 62,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    AppImage.business,
                  ),
                ),
                SizedBox(
                  width: 28.0,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    e.name,
                    style: AppTextStyles.textSize18(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.whiteColor
                            : AppColors.black),
                  ),
                  Text(
                    "Address Infor (get from Xero)",
                    style: AppTextStyles.textSize14(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.whiteColor
                            : AppColors.black),
                  )
                ]),
              ],
            )),
      );
    });
  }
}
