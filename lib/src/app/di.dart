import 'package:blood/src/core/secrets/app_secrets.dart';
import 'package:blood/src/features/auth/data/data_sources/i_user_remote_datasource.dart';
import 'package:blood/src/features/auth/data/data_sources/user_remote_datasource.dart';
import 'package:blood/src/features/auth/data/repositories/user_repository.dart';
import 'package:blood/src/features/auth/domain/repositories/i_user_repository.dart';
import 'package:blood/src/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:blood/src/features/auth/domain/usecases/register_usecase.dart';
import 'package:blood/src/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:blood/src/features/vivaMais/presentation/cubit/viva_mais_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final instance = GetIt.instance;

Future<void> init() async {
//-------------------------- Cubits------------------------

  //+++++++++++++++++ User Cubit Injection ++++++++++++++++
  instance.registerFactory(() => AuthCubit(registerUserCase: instance.call()));
  //+++++++++++++++++ APP Cubit Injection ++++++++++++++++
  instance.registerFactory(
      () => VivaMaisCubit(getCurrentUserCase: instance.call()));
//-------------------------- Usecases ---------------------
  //+++++++++++++++++ User Usecases Injection ++++++++++++++++
  instance.registerLazySingleton(
      () => RegisterUserCase(repository: instance.call()));
  instance.registerLazySingleton(
      () => GetCurrentUserCase(repository: instance.call()));

//-------------------------- Repository ---------------------
  //+++++++++++++++++ User Repository Injection ++++++++++++++++
  instance.registerLazySingleton<IUserRepository>(
      () => UserRepository(userRemoteDataSource: instance.call()));

//-------------------------- Remote Data Source ---------------------
  //+++++++++++++++++ User Remote Data Source Injection ++++++++++++++++
  instance.registerLazySingleton<IUserRemoteDataSource>(
      () => UserRemoteDataSource(secureStorage: instance.call()));

//-------------------------- External ---------------------
  // final supabase = await Supabase.initialize(
  //   url: AppSecrets.url,
  //   anonKey: AppSecrets.anonKey,
  // );
  final networkInfo = InternetConnectionChecker.createInstance();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  // instance.registerLazySingleton(() => supabase);
  instance.registerLazySingleton(() => networkInfo);
  instance.registerLazySingleton(() => secureStorage);
}
