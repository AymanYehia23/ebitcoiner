import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  Future<void> firstLoginAuth(
      {required String userName, required String password}) async {
    emit(FirstLoginLoadingState());
    try {
      await _loginRepo.fPostLogin(userName: userName, password: password);
      emit(FirstLoginSuccessState());
    } on DioError catch (_) {
      emit(FirstLoginErrorState());
    }
  }

  Future<void> secondeLoginAuth(
      {required String userName, required String otp}) async {
    emit(SecondeLoginLoadingState());
    try {
      _loginResponseModel = LoginResponseModel.fromJson(
        await _loginRepo.sPostLogin(userName: userName, otp: otp),
      );
      emit(SecondeLoginSuccessState());
    } on DioError catch (_) {
      emit(SecondeLoginErrorState());
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
      print(await _secureStorage.getValue(key: 'accessToken'));
      print(await _secureStorage.getValue(key: 'refreshToken'));
      emit(AutoLoginSuccessState());
    } else {
      emit(AutoLoginFailedState());
    }
  }

  //UI logic
  bool isEmpty = true;
  bool isObscure = true;
  IconData iconData = Icons.visibility_outlined;
  String userName = '';
  String password = '';

  void changeIsEmpty(bool i) {
    if (i) {
      isEmpty = true;
      emit(ChangeIsEmptyTrueState());
    } else {
      isEmpty = false;
      emit(ChangeIsEmptyFalseState());
    }
  }

  void changePasswordVisibility() {
    emit(ChangePasswordVisibilityInitialState());
    isObscure = !isObscure;
    iconData =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilitySuccessState());
  }
}
