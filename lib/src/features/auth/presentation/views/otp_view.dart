import 'package:blood/src/core/utils/app_strings.dart';
import 'package:blood/src/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../core/config/routes/routes.dart';
import '../../../../core/config/theme/color_palette.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  // String verificationId = Get.arguments as String;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.otp),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(AppPadding.p14),
          child: Column(
            children: [
              SizedBox(
                height: AppSize.s18,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      AppStrings.verifyCode,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: AppSize.s10,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: AppStrings.weveSendFourDigit,
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: <TextSpan>[
                          TextSpan(
                            text: '+244 931 225 614',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: AppStrings.makeSureYouEnterCorrect,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s40,
                    ),
                    OtpTextField(
                      numberOfFields: 4,
                      fieldWidth: AppSize.s70,
                      borderWidth: 1,

                      filled: true,
                      borderColor: AppColors.primaryColor,
                      focusedBorderColor: AppColors.primaryColor,
                      textStyle: Theme.of(context).textTheme.headlineLarge,
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Verification Code"),
                                content:
                                    Text('Code entered is $verificationCode'),
                              );
                            });
                      }, // end onSubmit
                    ),
                    SizedBox(
                      height: AppSize.s40,
                    ),
                    Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: AppStrings.notReciveCode,
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: <TextSpan>[
                              TextSpan(
                                text: ' ${AppStrings.resendCode}',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppSize.s30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            //Navigator.pushNamed(context, Routes.bloodRoute);
                            Navigator.of(context)
                                .pushNamed(Routes.vivaMaisRoute);
                          },
                          child: Text(AppStrings.keepingOn),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
