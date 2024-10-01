import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_entity.dart';

abstract class IUserRepository {
  Future<Either<Failure, String>> register(UserEntity user, File? image);
  Future<Either<Failure, UserEntity>> getCurrentUser();
}
