import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hash_store/data/repositories/forget_password_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._forgetPasswordRepo)
      : super(ForgetPasswordInitial());
  //Business logic
  final ForgetPasswordRepo _forgetPasswordRepo;
  String email = '';
  String recoveryCode = '';
  String accessToken = '';

  Future<void> forgetPassword(String email) async {
    emit(ForgetPasswordLoadingState());
    try {
      await _forgetPasswordRepo.postForgetPassword(email: email);
      emit(ForgetPasswordSuccessState());
    } on DioError catch (_) {
      emit(ForgetPasswordErrorState());
    }
  }

  Future<void> verifyCode(String code) async {
    emit(VerifyCodeLoadingState());
    try {
      accessToken =
          await _forgetPasswordRepo.postVerifyCode(code: code, email: email);
      emit(VerifyCodeSuccessState());
    } on DioError catch (_) {
      emit(VerifyCodeErrorState());
    }
  }

  Future<void> resetPassword(String newPassword) async {
    emit(ResetPasswordLoadingState());
    try {
      await _forgetPasswordRepo.postResetPassword(
        newPassword: newPassword,
        code: recoveryCode,
        accessToken: accessToken,
      );
      emit(ResetPasswordSuccessState());
    } on DioError catch (_) {
      emit(ResetPasswordErrorState());
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
    emit(ChangePasswordVisibilityLoadingState());
    isObscure = !isObscure;
    iconData =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilitySuccessState());
  }
}
