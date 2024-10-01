import 'package:animate_do/animate_do.dart';
import 'package:blood/src/app/app_entity.dart';
import 'package:blood/src/core/resources/app_icons.dart';
import 'package:blood/src/core/resources/app_images.dart';
import 'package:blood/src/core/utils/app_values.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';
import 'package:select_dialog/select_dialog.dart';

import '../../../../core/config/routes/routes.dart';
import '../../../../core/config/theme/color_palette.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String ex1 = "No value selected";
  Widget bloodIcon = Icon(FontAwesomeIcons.tint);
  TextEditingController blood = TextEditingController();

  List<String> bloods = [
    "A+",
    "B+",
    "AB-",
    "A-",
    "O-",
  ];

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
    return FadeInUp(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          title: Text(
            "Olá! Lingard.",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.notification),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(AppMargin.m16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   width: double.infinity,
                //   height: AppSize.s140,
                //   child: Stack(
                //     children: [
                //       Positioned(
                //         bottom: 0,
                //         right: 0,
                //         left: 0,
                //         child: Container(
                //           width: double.infinity,
                //           height: AppSize.s120,
                //           decoration: BoxDecoration(
                //             color: AppColors.primaryColor,
                //             borderRadius: BorderRadius.circular(AppSize.s14),
                //           ),
                //         ),
                //       ),
                //       Positioned(
                //         top: -50,
                //         right: -AppSize.s10,
                //         child: SvgPicture.asset(
                //           AppSvg.onBoarding2,
                //           width: AppSize.s200,
                //         ),
                //       ),
                //       Container(
                //         padding: EdgeInsets.all(10),
                //         child: Row(
                //           children: [
                //             Expanded(
                //               flex: 2,
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   SizedBox(
                //                     height: 20,
                //                   ),
                //                   Text(
                //                     "Estas qualificado para doar?",
                //                     style: TextStyle(
                //                       fontSize: 16,
                //                       fontWeight: FontWeight.w600,
                //                       color: Colors.white,
                //                     ),
                //                   ),
                //                   TextButton(
                //                     style: ButtonStyle(
                //                       backgroundColor: MaterialStatePropertyAll(
                //                         Colors.white,
                //                       ),
                //                       minimumSize: MaterialStatePropertyAll(
                //                         Size(10, 0),
                //                       ),
                //                     ),
                //                     onPressed: () {},
                //                     child: Text(
                //                       "Revise os Termos e Condições",
                //                       style: TextStyle(
                //                         fontSize: 12,
                //                         color: Colors.black87,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             Expanded(
                //               child: SizedBox.shrink(),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Estás a procura de sangue?",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: AppSize.s12,
                ),
                SizedBox(
                  height: AppSize.s12,
                ),

                // FormBuilderDropdown<String>(
                //   name: 'blood',
                //   autovalidateMode: AutovalidateMode.onUserInteraction,
                //   decoration: InputDecoration(
                //     hintText: 'Selecionar Grupo Snguíneo',
                //     suffixIcon: bloodIcon,
                //   ),
                //   validator: FormBuilderValidators.compose([
                //     FormBuilderValidators.required(
                //         errorText: "Grupo Sanguíneo obrigatório"),
                //   ]),
                //   items: bloods.map((bloodGroup) {
                //     return DropdownMenuItem(
                //       value: bloodGroup,
                //       child: Text(bloodGroup),
                //     );
                //   }).toList(),
                //   onChanged: (groupBlood) {
                //     svgBlood(groupBlood!);
                //     blood.text = groupBlood;
                //   },
                // ),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: AppSize.s25),
                    hintText: 'Selecionar Hospital',
                    suffixIcon: Icon(Icons.location_on_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSize.s12,
                ),

                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    hintText: 'Selecionar Grupo Snguíneo',
                    suffixIcon: bloodIcon,
                  ),
                  hint: const Text(
                    'Selecionar Grupo Snguíneo',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: bloods
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select gender.';
                    }
                    return null;
                  },
                  onChanged: (groupBlood) {
                    svgBlood(groupBlood!);
                    blood.text = groupBlood;
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
                SizedBox(
                  height: AppSize.s12,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(Routes.createRequestRoute);
                    },
                    child: Text("Enviar Pedido")),
                SizedBox(
                  height: AppSize.s30,
                ),
                Container(
                  width: double.infinity,
                  height: 120,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(Routes.postRoute);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: AppColors.strokeColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImages.request,
                                  width: 55,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    "Post Pedido Doador",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(Routes.bankBloodRoute);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: AppColors.strokeColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImages.bloodBank,
                                  width: 55,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    "Banco de Sangue",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(Routes.donorRoute);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: AppColors.strokeColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImages.emergency,
                                  width: 55,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Text(
                                    "Doador Emergente",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSize.s16,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppColors.strokeColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Grupo Sanguíneos",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      SizedBox(
                        height: AppSize.s12,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.ap,
                                  color: AppColors.primaryColor,
                                ),
                                Text(
                                  "10%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.bp,
                                  color: AppColors.primaryColor,
                                ),
                                Text(
                                  "5%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.abn,
                                  color: AppColors.primaryColor,
                                ),
                                Text(
                                  "7%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.an,
                                  color: AppColors.primaryColor,
                                ),
                                Text(
                                  "90%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.oN,
                                  color: AppColors.primaryColor,
                                ),
                                Text(
                                  "6%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mapa da Jornada de Sangue",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "Ver Mais",
                      style: TextStyle(color: AppColors.secondaryTextColor),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.all(AppPadding.p20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppColors.strokeColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      color: Colors.black12,
                                      width: 100,
                                      height: 100,
                                      child: Center(
                                        child: Text("MAPA"),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.user2,
                                            width: 18,
                                            color: AppColors.secondaryTextColor,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Azancot Menezes",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.location,
                                            width: 18,
                                            color: AppColors.secondaryTextColor,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Azancot Menezes",
                                            style: TextStyle(
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.hourglass_bottom,
                                            color: AppColors.secondaryTextColor,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "10:20, Abril 2024",
                                            style: TextStyle(
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Tempo restante para doação",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "02:30:01",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.primaryColor),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pedido de Doação",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "Ver Mais",
                      style: TextStyle(color: AppColors.secondaryTextColor),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.all(AppPadding.p20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppColors.strokeColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    color: Colors.red,
                                    child: Image.asset(
                                      AppImages.profile,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ana Martins",
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          AppIcons.location,
                                          width: 18,
                                          color: AppColors.secondaryTextColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Azancot Menezes",
                                          style: TextStyle(
                                            color: AppColors.secondaryTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.hourglass_bottom,
                                          color: AppColors.secondaryTextColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "10:20, Abril 2024",
                                          style: TextStyle(
                                            color: AppColors.secondaryTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: SvgPicture.asset(
                              AppIcons.an,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: AppColors.strokeColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Negar",
                            style: TextStyle(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 30,
                            color: AppColors.strokeColor,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.donateAcceptRoute);
                            },
                            child: Text(
                              "Doar Agora",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
