import 'dart:io';

import 'package:bookkeepa/config/app_images.dart';
import 'package:bookkeepa/config/app_text_styles.dart';
import 'package:bookkeepa/util/getLanguage.dart';
import 'package:bookkeepa/util/navigator_serivce.dart';
import 'package:bookkeepa/widgets/custom_btn.dart';
import 'package:bookkeepa/widgets/custom_containner.dart';
import 'package:bookkeepa/widgets/header_child.dart';
import 'package:bookkeepa/widgets/input_field.dart';
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
    super.initState();
  }

  @override
  void dispose() {
    nameController?.dispose();
    emailController?.dispose();
    phoneController?.dispose();
    employerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HeaderView(
          color: AppColors.whiteColor,
          child: HeaderChild(
              title: AppTranslations().getLanguage(context, 'editProfile'),
              style: AppTextStyles.textSize16(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.whiteColor
                      : AppColors.black),
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
                colorBorder: AppColors.border,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputField(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppMetrics.paddingContainer),
                      title: AppTranslations().getLanguage(context, 'fullName'),
                      hinttitle:
                          AppTranslations().getLanguage(context, 'fullName'),
                      style: AppTextStyles.textSize18(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.whiteColor
                              : AppColors.black),
                      textStyleHint:
                          AppTextStyles.textSize18(color: AppColors.blueLight),
                      textStyle: AppTextStyles.textSize18(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.colorText
                              : AppColors.blueLight),
                      textInputAction: TextInputAction.done,
                      controller: nameController,
                    ),
                    InputField(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppMetrics.paddingContainer),
                      title: AppTranslations().getLanguage(context, 'email'),
                      hinttitle:
                          AppTranslations().getLanguage(context, 'email'),
                      style: AppTextStyles.textSize18(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.whiteColor
                              : AppColors.black),
                      textStyleHint:
                          AppTextStyles.textSize18(color: AppColors.blueLight),
                      textStyle: AppTextStyles.textSize18(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.colorText
                              : AppColors.blueLight),
                      textInputAction: TextInputAction.done,
                      controller: emailController,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: AppMetrics.paddingContainer,
                          top: AppMetrics.paddingVertical),
                      child: Text(
                        AppTranslations().getLanguage(context, 'phoneNumber'),
                        style: AppTextStyles.textSize12(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.colorText
                                    : AppColors.blueLight),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppMetrics.paddingContainer),
                      alignment: Alignment.center,
                      child: InternationalPhoneNumberInput(
                        textStyle: AppTextStyles.textSize18(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.whiteColor
                                    : AppColors.blueLight),
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
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.whiteColor
                                    : AppColors.blueLight),
                        initialValue: number,
                        textFieldController: phoneController,
                        formatInput: false,
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputDecoration: InputDecoration(
                          hintText: '0412 345 678',
                          hintStyle: AppTextStyles.textSize18(
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? AppColors.whiteColor
                                  : AppColors.blueLight),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColors.blueLight),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.greenAccent),
                          ),
                        ),
                        onSaved: (PhoneNumber number) {
                          print('On Saved: $number');
                        },
                      ),
                    ),
                    InputField(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppMetrics.paddingContainer),
                      title:
                          AppTranslations().getLanguage(context, 'employeer'),
                      hinttitle:
                          AppTranslations().getLanguage(context, 'noWork'),
                      style: AppTextStyles.textSize18(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.whiteColor
                              : AppColors.black),
                      textStyleHint:
                          AppTextStyles.textSize18(color: AppColors.blueLight),
                      textStyle: AppTextStyles.textSize18(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.colorText
                              : AppColors.blueLight),
                      textInputAction: TextInputAction.done,
                      controller: employerController,
                    ),
                    SizedBox(
                      height: AppMetrics.paddingContainer,
                    )
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
                  text: AppTranslations().getLanguage(context, 'saveChanges'),
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
                  text: AppTranslations().getLanguage(context, 'cancel'),
                  height: MediaQuery.of(context).size.height * 0.075,
                  style: AppTextStyles.textSize14(color: AppColors.greyColor),
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
