import 'dart:async';
import 'dart:io';

import 'package:blood/src/features/auth/data/data_sources/i_user_remote_datasource.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/error/exception.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';

class UserRemoteDataSource extends IUserRemoteDataSource {
  //final Supabase supabase;
  final FlutterSecureStorage secureStorage;

  UserRemoteDataSource({required this.secureStorage});

  @override
  Future<String> register(UserEntity user, File? imageFile) async {
    String? imagePath;
    if (imageFile != null) {
      final bytes = await imageFile.readAsBytes();
      final fileExt = imageFile.path.split('.').last;
      final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
      final filePath = fileName;
      // await supabase.client.storage
      //     .from('avatars')
      //     .uploadBinary(filePath, bytes);
      // imagePath = await supabase.client.storage
      //     .from('avatars')
      // .createSignedUrl(filePath, 60 * 60 * 24 * 365 * 10);
    }

    final newUser = UserModel(
      firstName: user.firstName,
      lastName: user.lastName,
      phone: user.phone,
      email: user.email,
      avatar_url: imagePath,
      gender: user.gender,
      is_donor: user.is_donor,
      blood: user.blood,
      birth: user.birth,
    ).toJson();

    // final res = await supabase.client.auth.signUp(
    //   data: newUser,
    //   email: user.email,
    //   password: "123456",
    // );
    // await secureStorage.write(key: "uid", value: res.user!.id);
    //return res.user!.id;
    return "";
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    // final userId = supabase.client.auth.currentUser!.id;
    // try {
    //   final data = await supabase.client
    //       .from('users')
    //       .select()
    //       .eq("id", userId)
    //       .single()
    //       .timeout(Duration(seconds: 10));

    //   return UserModel.fromJson(data);
    // } on TimeoutException {
    //   throw ServerException();
    // } catch (e) {
    //   print("print");
    //   print(e);
    //   if (e is AuthException) {
    //     throw ServerException;
    //   }
    //   throw ServerException;
    // }
  }
}
