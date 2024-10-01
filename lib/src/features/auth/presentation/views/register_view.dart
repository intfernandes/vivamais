import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:blood/src/core/resources/app_images.dart';
import 'package:blood/src/features/auth/domain/entities/user_entity.dart';
import 'package:blood/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:blood/src/features/auth/presentation/cubit/auth_state.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_phone_field/form_builder_phone_field.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ndialog/ndialog.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:phone_text_field/phone_text_field.dart';
import 'package:quickalert/quickalert.dart';

import '../../../../app/app_entity.dart';
import '../../../../core/config/routes/routes.dart';
import '../../../../core/config/theme/color_palette.dart';
import '../../../../core/resources/app_icons.dart';
import '../../../../core/resources/app_svg.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_values.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController firstName = TextEditingController();

  TextEditingController lastName = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController gender = TextEditingController();
  DateTime birth = DateTime.now();
  TextEditingController birthText = TextEditingController();
  TextEditingController nascimento = TextEditingController();
  TextEditingController blood = TextEditingController();
  bool is_donor = false;

  final _formKey = GlobalKey<FormBuilderState>();
  List<String> genders = ["Masculino", "Femenino"];
  List<String> bloods = [
    "A+",
    "B+",
    "AB-",
    "A-",
    "O-",
  ];

  Widget bloodIcon = Icon(FontAwesomeIcons.tint);

  XFile? image;

  Future<void> uploadImage() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      image = imageFile;
    });
    //setState(() => _isLoading = true);
  }

  Future<void> removeImage() async {
    setState(() {
      image = null;
    });
    //setState(() => _isLoading = true);
  }

  void svgBlood(String blood) {
    switch (blood) {
      case "A+":
        setState(() {
          bloodIcon = SvgPicture.asset(
            AppIcons.ap,
            width: 12,
            color: AppColors.primaryColor,
          );
        });
        break;

      case "B+":
        setState(() {
          bloodIcon = SvgPicture.asset(
            AppIcons.bp,
            width: 12,
            color: AppColors.primaryColor,
          );
        });
        break;
      case "AB-":
        setState(() {
          bloodIcon = SvgPicture.asset(
            AppIcons.abn,
            width: 12,
            color: AppColors.primaryColor,
          );
        });
        break;
      case "A-":
        setState(() {
          bloodIcon = SvgPicture.asset(
            AppIcons.an,
            width: 12,
            color: AppColors.primaryColor,
          );
        });
        break;
      case "O-":
        setState(() {
          bloodIcon = SvgPicture.asset(
            AppIcons.oN,
            width: 12,
            color: AppColors.primaryColor,
          );
        });
      default:
        setState(() {
          bloodIcon = Icon(
            FontAwesomeIcons.tint,
            color: AppColors.primaryColor,
          );
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.register),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            ProgressDialog progressDialog = ProgressDialog(
              context,
              blur: 5,
              title: SizedBox.shrink(),
              message: Text("Registando.."),
              onDismiss: () => print("Do something onDismiss"),
            );
            progressDialog.show();
          } else if (state is Authenticated) {
            AppEntity.uid = state.uid;

            Navigator.of(context).pushNamed(Routes.vivaMaisRoute);
          } else if (state is AuthError) {
            Navigator.of(context).pop();
            DialogBackground(
              blur: 5,
              dialog: AlertDialog(
                title: Text(
                  "Error",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                content: Text("${state.error}"),
                actions: <Widget>[
                  TextButton(
                      child: Text("Fechar"),
                      onPressed: () => Navigator.pop(context)),
                ],
              ),
            ).show(context);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.all(AppPadding.p16),
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Text(
                      //   AppStrings.createAccount,
                      //   style: Theme.of(context).textTheme.headlineSmall,
                      // ),
                      // SizedBox(
                      //   height: AppSize.s10,
                      // ),
                      Stack(
                        children: [
                          Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                width: 1,
                                color: AppColors.strokeColor,
                              ),
                            ),
                            child: (image == null)
                                ? Icon(
                                    Icons.add_a_photo_outlined,
                                    color: AppColors.secondaryTextColor,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.file(
                                      File(image!.path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: (image == null)
                                ? InkWell(
                                    onTap: uploadImage,
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                          width: 2,
                                          color: AppColors.strokeColor,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.image,
                                        size: 20,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: removeImage,
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                          width: 2,
                                          color: AppColors.strokeColor,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        size: 20,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: FormBuilderTextField(
                              name: "first name",
                              controller: firstName,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                hintText: "Primeiro Nome",
                                suffixIcon: Icon(
                                  Icons.person,
                                ),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  errorText: "Campo obrigatório",
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: FormBuilderTextField(
                              name: "last name",
                              controller: lastName,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                hintText: "Último Nome",
                                suffixIcon: Icon(
                                  Icons.person,
                                ),
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  errorText: "Campo obrigatório",
                                ),
                              ]),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s12,
                      ),

                      /// params
                      PhoneFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: PhoneValidator.compose([
                          PhoneValidator.required(
                            errorText: "Telefone obrigatório",
                          ),
                          PhoneValidator.validMobile(
                            errorText: "Telefone inválido",
                          )
                        ]),
                        onChanged: (phoneNumber) =>
                            print('changed into $phoneNumber'),
                        enabled: true,
                        isCountrySelectionEnabled: true,
                      ),

                      SizedBox(
                        height: AppSize.s12,
                      ),
                      FormBuilderTextField(
                        name: "email",
                        controller: email,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "E-mail",
                          suffixIcon: Icon(
                            Icons.mail,
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.email(
                              errorText: "E-mail inválido"),
                          FormBuilderValidators.required(
                              errorText: "E-mail obrigatório"),
                        ]),
                      ),
                      SizedBox(
                        height: AppSize.s12,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: FormBuilderDropdown<String>(
                              name: 'gender',
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                //labelText: 'Gender',
                                hintText: 'Gênero',
                              ),
                              items: genders
                                  .map((gender) => DropdownMenuItem(
                                        value: gender,
                                        child: Text(gender),
                                      ))
                                  .toList(),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: "Gênero obrigatório"),
                              ]),
                              onChanged: (value) {
                                print(value);
                                gender.text = value!;
                              },
                            ),
                          ),

                          // Expanded(
                          //   child: FormBuilderTextField(
                          //     name: "gender",
                          //     controller: gender,
                          //     decoration: InputDecoration(
                          //       hintText: "Gênero",
                          //       suffixIcon: Icon(
                          //         Icons.keyboard_arrow_down,
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: FormBuilderDateTimePicker(
                              name: 'birth',
                              controller: birthText,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              format: DateFormat('yyyy-MM-dd'),
                              inputType: InputType.date,
                              initialEntryMode: DatePickerEntryMode.calendar,
                              decoration: InputDecoration(
                                hintText: "Nascimento",
                              ),
                              onChanged: (value) {
                                birth = value!;
                              },
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: "Nascimento obrigatório"),
                              ]),
                            ),
                          ),
                          // Expanded(
                          //   child: FormBuilderTextField(
                          //     name: "birth",
                          //     controller: birth,
                          //     decoration: InputDecoration(
                          //       hintText: "Nascimento",
                          //       suffixIcon: Icon(
                          //         Icons.calendar_today,
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s12,
                      ),
                      FormBuilderDropdown<String>(
                        name: 'blood',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          //labelText: 'Grupo Sangíneo',
                          hintText: 'Grupo Sangíneo',
                          suffixIcon: bloodIcon,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: "Grupo Sanguíneo obrigatório"),
                        ]),
                        items: bloods.map((bloodGroup) {
                          return DropdownMenuItem(
                            value: bloodGroup,
                            child: Text(bloodGroup),
                          );
                        }).toList(),
                        onChanged: (groupBlood) {
                          svgBlood(groupBlood!);
                          print(groupBlood);
                          blood.text = groupBlood;
                        },
                      ),

                      SizedBox(
                        height: AppSize.s12,
                      ),
                      FormBuilderCheckbox(
                        name: 'donor',
                        title: Text(
                          "Registar como doador",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        contentPadding: EdgeInsets.all(0),
                        checkColor: AppColors.whiteColor,
                        activeColor: AppColors.primaryColor,
                        selected: true,
                        onChanged: (value) {
                          is_donor = value!;
                        },
                      ),
                      SizedBox(
                        height: AppSize.s12,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print(firstName.text);
                          print(lastName.text);
                          //print(phone.value!.nsn);
                          print(email.text);
                          print(birthText.text);
                          print(gender.text);
                          print(blood.text);
                          print(is_donor);

                          Navigator.pushNamed(context, Routes.otpRoute);

                          // if (_formKey.currentState!.validate()) {
                          //   final user = UserEntity(
                          //     firstName: firstName.text,
                          //     lastName: lastName.text,
                          //     password: "123456SS7",
                          //     phone: phone.value!.nsn,
                          //     email: email.text,
                          //     avatar_url: "aaaaa",
                          //     gender: gender.text,
                          //     blood: blood.text,
                          //     is_donor: is_donor,
                          //     birth: DateTime.parse(birthText.text),
                          //   );
                          //   if (image == null) {
                          //     BlocProvider.of<AuthCubit>(context)
                          //         .register(user, null);
                          //   } else {
                          //     BlocProvider.of<AuthCubit>(context)
                          //         .register(user, File(image!.path));
                          //   }
                          // }
                        },
                        child: Text(AppStrings.keepingOn),
                      ),
                      SizedBox(
                        height: AppSize.s12,
                      ),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(text: "Já tem uma conta? "),
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppSize.s12,
                      ),
                      Text(
                        "Pesquisa Rápida",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
