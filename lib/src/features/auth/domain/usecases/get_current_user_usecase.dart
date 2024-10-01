import 'package:blood/src/core/error/failure.dart';
import 'package:blood/src/features/auth/domain/entities/user_entity.dart';
import 'package:blood/src/features/auth/domain/repositories/i_user_repository.dart';
import 'package:dartz/dartz.dart';

class GetCurrentUserCase {
  final IUserRepository repository;

  GetCurrentUserCase({required this.repository});

  Future<Either<Failure, UserEntity?>> call() async {
    return await repository.getCurrentUser();
  }
}
