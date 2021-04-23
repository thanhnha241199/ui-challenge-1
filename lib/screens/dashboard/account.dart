import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/screens/dashboard/profile.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_metrics.dart';
import '../../widgets/header_view.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderView(
          color: Colors.transparent,
          height: 90.0,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppMetrics.paddingHorizotal,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Text("")),
                Expanded(
                    flex: 4,
                    child: Text(
                      "Account",
                      style: AppTextStyles.textSize16(),
                      textAlign: TextAlign.center,
                    )),
                Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    AppImage.notification,
                    alignment: Alignment.center,
                  ),
                )
              ],
            ),
          )),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: GestureDetector(
              onTap: () {
                NavigationService.instance.navigateTo(ProfileScreen());
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 62,
                          width: 62,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Lucas Flalonia",
                              style: AppTextStyles.textSize18(
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "lucasflatonia@gmail.com",
                              style: AppTextStyles.textSize14(),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "+61 342 554 321",
                              style: AppTextStyles.textSize14(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImage.notification,
                            alignment: Alignment.center,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Switch to Anothe Bussiness",
                            style: AppTextStyles.textSize16(),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            padding: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImage.notification,
                            alignment: Alignment.center,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Notification Preferences",
                            style: AppTextStyles.textSize16(),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImage.notification,
                            alignment: Alignment.center,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Update Password",
                            style: AppTextStyles.textSize16(),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            padding: EdgeInsets.symmetric(vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImage.notification,
                            alignment: Alignment.center,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Support",
                            style: AppTextStyles.textSize16(),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImage.notification,
                            alignment: Alignment.center,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Privacy Policy",
                            style: AppTextStyles.textSize16(),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImage.notification,
                            alignment: Alignment.center,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            "Log out",
                            style: AppTextStyles.textSize16(),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: SvgPicture.asset(
        AppImage.floatbtn,
      ),
    );
  }
}
