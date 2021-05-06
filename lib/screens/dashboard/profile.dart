import 'dart:io';

import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:path/path.dart';

import '../../config/app_colors.dart';
import '../../config/app_metrics.dart';
import '../../util/navigator_serivce.dart';
import '../../widgets/header_view.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController,
      emailController,
      phoneController,
      employerController;
  String initialCountry = 'AU';
  PhoneNumber number = PhoneNumber(isoCode: 'AU');
  File _imageFile;
  final ImagePicker picker = ImagePicker();
  @override
  void initState() {
    nameController = TextEditingController(text: 'Jerry Smith');
    emailController = TextEditingController(text: 'jerrysmith@gmail.com');
    phoneController = TextEditingController(text: '0412 345 678');
    employerController = TextEditingController(text: 'Mo Works');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HeaderView(
          color: Colors.transparent,
          child: HeaderChild(
              title: AppTranslations().getLanguage(context, 'editProfile'),
              style: AppTextStyles.textSize16(),
              leftIcon: SvgPicture.asset(AppImage.arrow_back))),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              CustomContainer(
                edgeInsets: EdgeInsets.symmetric(
                    vertical: AppMetrics.paddingVertical,
                    horizontal: AppMetrics.paddingHorizotal),
                colorBorder: AppColors.border,
                child: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: AppMetrics.paddingVertical,
                        horizontal: AppMetrics.paddingHorizotal),
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
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                AppImage.avatar,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              AppTranslations()
                                  .getLanguage(context, 'editPhoto'),
                              style: AppTextStyles.textSize18(
                                  color: AppColors.green),
                            ),
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          AppImage.arrowforward,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomContainer(
                edgeInsets: EdgeInsets.symmetric(
                    horizontal: AppMetrics.paddingHorizotal),
                padding:
                    EdgeInsets.symmetric(vertical: AppMetrics.paddingContent),
                colorBorder: AppColors.border,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppMetrics.paddingHorizotal,
                            vertical: AppMetrics.paddingContent),
                        alignment: Alignment.center,
                        child: TextField(
                          style: AppTextStyles.textSize18(
                              color: AppColors.blueLight),
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'Jerry Smith',
                            labelText: 'Full Name',
                            hintStyle: AppTextStyles.textSize18(
                                color: AppColors.blueLight),
                            labelStyle: AppTextStyles.textSize12(
                                color: AppColors.blueLight),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey10),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey10),
                            ),
                          ),
                        )),
                    Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppMetrics.paddingHorizotal,
                        ),
                        child: TextField(
                          controller: emailController,
                          style: AppTextStyles.textSize18(
                              color: AppColors.blueLight),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'jerrysmith@gmail.com',
                            hintStyle: AppTextStyles.textSize18(
                                color: AppColors.blueLight),
                            labelStyle: AppTextStyles.textSize12(
                                color: AppColors.blueLight),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey10),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey10),
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                          left: AppMetrics.paddingHorizotal,
                          top: AppMetrics.paddingVertical),
                      child: Text(
                        'Phone Number',
                        style: AppTextStyles.textSize12(
                            color: AppColors.blueLight),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: AppMetrics.paddingHorizotal,
                          right: AppMetrics.paddingHorizotal),
                      alignment: Alignment.center,
                      child: InternationalPhoneNumberInput(
                        textStyle: AppTextStyles.textSize18(
                            color: AppColors.blueLight),
                        onInputChanged: (PhoneNumber number) {
                          print(number.phoneNumber);
                        },
                        onInputValidated: (bool value) {
                          print(value);
                        },
                        selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.DIALOG),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: AppTextStyles.textSize18(
                            color: AppColors.blueLight),
                        initialValue: number,
                        textFieldController: phoneController,
                        formatInput: false,
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputDecoration: InputDecoration(
                          hintText: '0412 345 678',
                          hintStyle: AppTextStyles.textSize18(
                              color: AppColors.blueLight),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.grey10),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.grey10),
                          ),
                        ),
                        onSaved: (PhoneNumber number) {
                          print('On Saved: $number');
                        },
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppMetrics.paddingHorizotal,
                            vertical: AppMetrics.paddingContent),
                        alignment: Alignment.center,
                        child: TextField(
                          controller: employerController,
                          style: AppTextStyles.textSize18(
                              color: AppColors.blueLight),
                          decoration: InputDecoration(
                            hintText: 'Mo works',
                            labelText: 'Employer',
                            hintStyle: AppTextStyles.textSize18(
                                color: AppColors.blueLight),
                            labelStyle: AppTextStyles.textSize12(
                                color: AppColors.blueLight),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey10),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grey10),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.0,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  ontap: () {},
                  borderColor: AppColors.greenAccent,
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
                  borderColor: AppColors.greenAccent,
                  color: AppColors.whiteColor,
                  text: "Cancel",
                  height: MediaQuery.of(context).size.height * 0.075,
                  style: AppTextStyles.textSize14(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10.0),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Container(
                    margin: EdgeInsets.only(right: 5.0, left: 5.0, top: 10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 50.0,
                            height: 5.0,
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () async {
                                  // final pickeeLibrary = await picker.getImage(
                                  //     source: ImageSource.gallery);
                                  // _imageFile = File(pickeeLibrary.path);
                                  // String fileName = basename(_imageFile.path);
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: AppColors.greenAccent,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Icon(Icons.photo_library)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Lirary",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              GestureDetector(
                                onTap: () async {
                                  // final pickedCamera = await picker.getImage(
                                  //     source: ImageSource.camera);

                                  // _imageFile = File(pickedCamera.path);
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: AppColors.greenAccent,
                                              borderRadius:
                                                  BorderRadius.circular(25)),
                                          child: Icon(Icons.camera)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("Camera",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container()
                        ]))),
          );
        });
  }
}
