import 'dart:io';

import 'package:blood/src/core/error/failure.dart';
import 'package:blood/src/features/auth/domain/entities/user_entity.dart';
import 'package:blood/src/features/auth/domain/repositories/i_user_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUserCase {
  final IUserRepository repository;

  RegisterUserCase({required this.repository});

  Future<Either<Failure, String>> call(UserEntity user, File? image) async {
    return await repository.register(user, image);
  }
}
