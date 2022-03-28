import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hash_store/core/secure_storage/secure_storage.dart';
import 'package:hash_store/data/models/login_model.dart';
import 'package:hash_store/data/repositories/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._loginRepo,
    this._loginResponseModel,
    this._secureStorage,
  ) : super(LoginInitial());

  //Business logic
  final SecureStorageRepo _secureStorage;
  final LoginRepo _loginRepo;
  LoginResponseModel _loginResponseModel;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      _loginResponseModel =
          await _loginRepo.postLogin(email: email, password: password);
      emit(LoginSuccessState());
    } on DioError catch (_) {
      emit(LoginErrorState());
    }
  }

  Future<void> saveTokens() async {
    emit(SaveTokensLoadingState());
    await _secureStorage.addValue(
        key: 'accessToken', value: _loginResponseModel.jwt?.accessToken);
    await _secureStorage.addValue(
      key: 'refreshToken',
      value: _loginResponseModel.jwt?.refreshToken,
    );
    emit(SaveTokensSuccessState());
  }

  Future<void> tryAutoLogin() async {
    emit(AutoLoginLoadingState());
    if (await _secureStorage.containsKey(key: 'accessToken')) {
      emit(AutoLoginSuccessState());
    } else {
      emit(AutoLoginFailedState());
    }
  }

  //UI logic
  bool isEmpty = true;
  bool isObscure = true;
  IconData iconData = Icons.visibility_outlined;

  void changePasswordVisibility() {
    emit(ChangePasswordVisibilityLoadingState());
    isObscure = !isObscure;
    iconData =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilitySuccessState());
  }
}
