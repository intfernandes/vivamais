import 'package:blood/src/core/config/theme/color_palette.dart';
import 'package:blood/src/core/resources/app_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:phone_text_field/phone_text_field.dart';

import '../../../../core/config/routes/app_pages.dart';
import '../../../../core/config/routes/routes.dart';
import '../../../../core/resources/app_svg.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final PhoneController _phoneController = PhoneController(null);
  ValueNotifier<bool> isValidate = ValueNotifier<bool>(false);

  Future otpFunc() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+244-931225614',
      verificationCompleted: (PhoneAuthCredential credential) {
        print("verification completed");
      },
      verificationFailed: (FirebaseAuthException e) {
        print("verify failed");
      },
      codeSent: (String verificationId, int? resendToken) {
        print("code send $verificationId");
        Get.toNamed(Routes.otpRoute, arguments: verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(AppPadding.p10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: SvgPicture.asset(
                    AppSvg.auth,
                    width: AppSize.s300,
                  ),
                ),
                SizedBox(
                  height: AppSize.s25,
                ),
                Text(
                  AppStrings.loginOrRegister,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: AppSize.s12,
                ),
                Text(
                  AppStrings.authInfo,
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: AppSize.s20,
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(AppSize.s8),
                //   child: PhoneTextField(
                //     locale: const Locale(AppStrings.pt),
                //     showCountryCodeAsIcon: true,
                //     dialogTitle: AppStrings.selectCountry,
                //     decoration: const InputDecoration(
                //       filled: true,
                //       contentPadding: EdgeInsets.only(
                //           left: AppPadding.p10, top: AppPadding.p10),
                //       border: InputBorder.none,
                //       hintText: AppStrings.phone,
                //       fillColor: AppColors.primaryColor20,
                //     ),
                //     searchFieldInputDecoration: const InputDecoration(
                //       filled: true,
                //       border: InputBorder.none,
                //       suffixIcon: Icon(Icons.search),
                //       hintText: AppStrings.searchCountry,
                //     ),
                //     initialCountryCode: AppStrings.ao,
                //     onChanged: (phone) {
                //       debugPrint(phone.completeNumber);
                //     },
                //   ),
                // ),
                Form(
                  child: PhoneFormField(
                    validator: PhoneValidator.compose([
                      // list of validators to use
                      PhoneValidator.required(
                          errorText: "You must enter a value"),
                      PhoneValidator.validMobile(),
                      // ..
                    ]),
                    controller: _phoneController,
                    defaultCountry: IsoCode.AO,
                    autovalidateMode: AutovalidateMode.always,
                    decoration: const InputDecoration(
                      filled: true,
                      contentPadding: EdgeInsets.only(
                          left: AppPadding.p10, top: AppPadding.p10),
                      border: InputBorder.none,
                      hintText: AppStrings.phone,
                      fillColor: AppColors.primaryColor20,
                    ),
                    countrySelectorNavigator:
                        const CountrySelectorNavigator.searchDelegate(),
                    onChanged: (phoneNumber) =>
                        print('changed into $phoneNumber'),
                    enabled: true,
                    isCountrySelectionEnabled: true,
                    onSubmitted: (value) {
                      print(value);
                    },
                  ),
                ),

                SizedBox(
                  height: AppSize.s8,
                ),
                RichText(
                  text: TextSpan(
                    text: "${AppStrings.forgetOrChanged} ",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: AppSize.s14,
                      fontFamily: AppStrings.fontFamily,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: " ${AppStrings.clickHere}",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle the tap here (e.g., navigate or show a message)
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Button Clicked!')),
                            );
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSize.s20,
                ),

                ElevatedButton(
                  onPressed: () async {
                    if (_phoneController.value!.isValid()) {
                      await otpFunc();
                      print("true");
                    } else {
                      print("False");
                    }
                    // Navigator.pushNamed(context, Routes.otpRoute);
                  },
                  child: Text(AppStrings.keepingOn),
                ),

                SizedBox(
                  height: AppSize.s20,
                ),
                RichText(
                  text: TextSpan(
                    text: "${AppStrings.doesNotHaveAccount} ",
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: AppSize.s14,
                      fontFamily: AppStrings.fontFamily,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: " ${AppStrings.createAccount}",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(Routes.registerRoute);
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: ElevatedButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, Routes.otpRoute);
      //   },
      //   child: Text(AppStrings.keepingOn),
      // ),
    );
  }
}


  // ClipRRect(
  //                 borderRadius: BorderRadius.circular(AppSize.s8),
  //                 child: PhoneTextField(
  //                   locale: const Locale(AppStrings.pt),
  //                   showCountryCodeAsIcon: true,
  //                   dialogTitle: AppStrings.selectCountry,
  //                   decoration: const InputDecoration(
  //                     filled: true,
  //                     contentPadding: EdgeInsets.only(
  //                         left: AppPadding.p10, top: AppPadding.p10),
  //                     border: InputBorder.none,
  //                     hintText: AppStrings.phone,
  //                     fillColor: AppColors.primaryColor20,
  //                   ),
  //                   searchFieldInputDecoration: const InputDecoration(
  //                     filled: true,
  //                     border: InputBorder.none,
  //                     suffixIcon: Icon(Icons.search),
  //                     hintText: AppStrings.searchCountry,
  //                   ),
  //                   initialCountryCode: AppStrings.ao,
  //                   onChanged: (phone) {
  //                     debugPrint(phone.completeNumber);
  //                   },
  //                 ),
  //               ),
              