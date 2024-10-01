import 'dart:io';

import 'package:blood/src/core/error/error_handle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/register_usecase.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final RegisterUserCase registerUserCase;
  AuthCubit({required this.registerUserCase}) : super(AuthInitial());

  Future<void> register(UserEntity user, File? image) async {
    emit(AuthLoading());
    final res = await registerUserCase.call(user, image);

    res.fold((failure) => emit(AuthError(error: ErrorHandle.handle(failure))),
        (uid) => emit(Authenticated(uid: uid.toString())));
  }
}
