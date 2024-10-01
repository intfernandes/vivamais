import 'package:blood/src/core/error/error_handle.dart';
import 'package:blood/src/core/error/failure.dart';
import 'package:blood/src/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'viva_mais_state.dart';

class VivaMaisCubit extends Cubit<VivaMaisState> {
  final GetCurrentUserCase getCurrentUserCase;
  VivaMaisCubit({required this.getCurrentUserCase}) : super(VivaMaisInitial());

  Future<void> appStart() async {
    emit(VivaMaisLoading());
    final res = await getCurrentUserCase.call();

    res.fold((failure) {
      print(failure);
      emit(VivaMaisError(error: ErrorHandle.handle(failure)));
    }, (user) => emit(VivaMaisStarted(currentUser: user!)));
  }
}
