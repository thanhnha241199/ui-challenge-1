import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/app_colors.dart';
import '../../config/app_metrics.dart';
import '../../util/navigator_serivce.dart';
import '../../widgets/header_view.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        NavigationService.instance.goback();
                      },
                      child: SvgPicture.asset(
                        AppImage.arrow_back,
                        alignment: Alignment.center,
                      ),
                    )),
                Expanded(
                    flex: 4,
                    child: Text(
                      "Edit Profile",
                      style: AppTextStyles.textSize16(),
                      textAlign: TextAlign.center,
                    )),
                Expanded(
                  flex: 1,
                  child: Text(''),
                )
              ],
            ),
          )),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
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
                      Text(
                        "Edit Photo",
                        style: AppTextStyles.textSize20(
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios)
                ],
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
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Jerry Smith', labelText: 'Full NAme'),
                    )),
                Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    alignment: Alignment.center,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'jerrysmith@gmail.com', labelText: 'Email'),
                    )),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: '+61', labelText: 'Phone number'),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          flex: 4,
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: '0412 345 678',
                                labelText: 'Phone number'),
                          ),
                        )
                      ],
                    )),
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    alignment: Alignment.center,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Employer', labelText: 'Mo Works'),
                    )),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    ontap: () {},
                    color: AppColors.greenAccent,
                    text: "Save Changes",
                    height: MediaQuery.of(context).size.height * 0.075,
                    style: AppTextStyles.textSize14(),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    ontap: () {
                      NavigationService.instance.goback();
                    },
                    color: AppColors.whiteColor,
                    text: "Cancel",
                    height: MediaQuery.of(context).size.height * 0.075,
                    style: AppTextStyles.textSize14(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
