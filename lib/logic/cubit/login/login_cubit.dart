import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hash_store/core/secure_storage/secure_storage.dart';
import 'package:hash_store/data/models/login_model.dart';
import 'package:hash_store/data/repositories/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  LoginCubit({required this.loginRepo}) : super(LoginInitial());


  //Business logic
  LoginRepo loginRepo;
  late LoginResponseModel loginModel;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      loginModel = await loginRepo.postLogin(email: email, password: password);
      emit(LoginSuccessState());
      await SecureStorage.addValue(
          key: 'accessToken', value: loginModel.jwt?.accessToken);
      await SecureStorage.addValue(
        key: 'refreshToken',
        value: loginModel.jwt?.refreshToken,
      );
    } on DioError catch (_) {
      emit(LoginErrorState());
    }
  }

  Future<void> tryAutoLogin() async {
    emit(AutoLoginLoadingState());
    if (await SecureStorage.containsKey(key: 'accessToken')) {
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
    isObscure = !isObscure;
    iconData =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
