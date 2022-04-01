import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hash_store/core/secure_storage/secure_storage.dart';
import 'package:hash_store/data/models/login_model.dart';
import 'package:hash_store/data/repositories/login_repo.dart';
import 'package:hive/hive.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._loginRepo,
    this._loginResponseModel,
    this._secureStorage,
    this._userDataBox,
    this.userData,
  ) : super(LoginInitial());

  //Business logic
  final SecureStorageRepo _secureStorage;
  final LoginRepo _loginRepo;
  LoginResponseModel _loginResponseModel;
  final Box _userDataBox;
  User userData;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      _loginResponseModel =
          await _loginRepo.postLogin(email: email, password: password);
      Hive.box('userData').put('userData', _loginResponseModel.user);
      emit(LoginSuccessState());
      userData = _userDataBox.get('userData');
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
      userData = _userDataBox.get('userData');
      emit(AutoLoginSuccessState());
    } else {
      emit(AutoLoginFailedState());
    }
  }

  //UI logic
  bool isEmpty = true;
  bool isObscure = true;
  IconData iconData = Icons.visibility_outlined;

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
