import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hash_store/data/repositories/logout_repo.dart';
import 'package:meta/meta.dart';

import '../../../core/secure_storage/secure_storage.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._logoutRepo, this._secureStorage) : super(LogoutInitial());

  //Business logic
  final SecureStorageRepo _secureStorage;
  final LogoutRepo _logoutRepo;

  Future<void> logout(String? refreshToken) async {
    emit(LogoutLoadingState());
    try {
      await _logoutRepo.postLogout(
        refreshToken: refreshToken,
      );
      emit(LogoutSuccessState());
    } on DioError catch (_) {
      emit(LogoutErrorState());
    }
  }

  Future<String?> getSavedRefreshToken() async {
    emit(GetSavedRefreshTokenLoadingState());
    String? refreshToken = await _secureStorage.getValue(key: 'refreshToken');
    emit(GetSavedRefreshTokenSuccessState());
    return refreshToken;
  }

  Future<void> deleteSavedTokens() async {
    emit(DeleteSavedRefreshTokenLoadingState());
    await _secureStorage.deleteValue(key: 'accessToken');
    await _secureStorage.deleteValue(key: 'refreshToken');
    await _secureStorage.deleteValue(key: 'name');
    emit(DeleteSavedRefreshTokenSuccessState());
  }
}
