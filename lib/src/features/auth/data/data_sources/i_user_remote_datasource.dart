import 'dart:io';

import '../../domain/entities/user_entity.dart';

abstract class IUserRemoteDataSource {
  Future<String> register(UserEntity user, File? image);
  Future<UserEntity?> getCurrentUser();
}
