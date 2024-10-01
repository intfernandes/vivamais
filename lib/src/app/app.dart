import 'package:blood/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:blood/src/features/vivaMais/presentation/cubit/viva_mais_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../core/config/routes/app_pages.dart';
import '../core/config/theme/themes.dart';
import 'di.dart' as di;

class BloodApp extends StatelessWidget {
  const BloodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.instance<AuthCubit>(),
        ),
        BlocProvider(
          create: (_) => di.instance<VivaMaisCubit>()..appStart(),
        )
      ],
      child: GetMaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
