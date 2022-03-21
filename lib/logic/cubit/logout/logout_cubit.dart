import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hash_store/data/repositories/logout_repo.dart';
import 'package:meta/meta.dart';

import '../../../core/secure_storage/secure_storage.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit({required this.logoutRepo}) : super(LogoutInitial());

  
  //Business logic
  LogoutRepo logoutRepo;
  Future<void> logout() async {
    emit(LogoutLoadingState());
    try {
      await logoutRepo.postLogout(refreshToken: await SecureStorage.getValue(key: 'refreshToken'));
      await SecureStorage.deleteValue(key: 'accessToken');
      await SecureStorage.deleteValue(key: 'refreshToken');
      emit(LogoutSuccessState());
    } on DioError catch (_) {
      emit(LogoutErrorState());
    }
  }
}
