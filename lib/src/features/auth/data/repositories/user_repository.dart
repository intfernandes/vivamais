import 'dart:io';

import 'package:blood/src/core/error/failure.dart';
import 'package:blood/src/features/auth/domain/entities/user_entity.dart';
import 'package:blood/src/features/auth/domain/repositories/i_user_repository.dart';
import 'package:dartz/dartz.dart';

import '../data_sources/i_user_remote_datasource.dart';

class UserRepository implements IUserRepository {
  final IUserRemoteDataSource userRemoteDataSource;

  UserRepository({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, String>> register(UserEntity user, File? image) async {
    try {
      final res = await userRemoteDataSource.register(user, image);

      return Right(res);
    } catch (e) {
      print("s");
      print(e);
      // if (e is AuthException) {
      //   if (e.statusCode == "422") {
      //     return Left(DuplicateUserFailure());
      //   } else if (e.statusCode == "500") {
      //     return Left(DuplicatePhoneFailure());
      //   }
      //   return Left(ServerFailure());
      // }
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    try {
      final res = await userRemoteDataSource.getCurrentUser();
      print(res);
      return Right(res!);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
