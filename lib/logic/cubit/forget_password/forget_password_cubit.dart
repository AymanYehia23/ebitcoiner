import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hash_store/core/constants/strings.dart';
import 'package:hash_store/core/secure_storage/secure_storage.dart';
import 'package:hash_store/data/models/forget_password_model.dart';
import 'package:hash_store/data/repositories/forget_password_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._forgetPasswordRepo, this.secureStorageRepo)
      : super(ForgetPasswordInitial());
  //Business logic
  final ForgetPasswordRepo _forgetPasswordRepo;
  final SecureStorageRepo secureStorageRepo;
  String email = '';
  String recoveryCode = '';
  String accessToken = '';

  Future<void> forgetPassword(String email) async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(ForgetPasswordLoadingState());
    try {
      await _forgetPasswordRepo.postForgetPassword(
          forgetPasswordModel: ForgetPasswordModel(email: email));
      emit(ForgetPasswordSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      } else if (error.response!.statusCode == 401) {
        errorMessage = 'Email not found!';
      }
      emit(ForgetPasswordErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(ForgetPasswordErrorState(errorMessage: errorMessage));
    }
  }

  Future<void> verifyCode(String code) async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(VerifyCodeLoadingState());
    try {
      accessToken = await _forgetPasswordRepo.postVerifyCode(
        verifyCodeModel: VerifyCodeModel(
          email: email,
          code: code,
        ),
      );
      await secureStorageRepo.addValue(key: 'accessToken', value: accessToken);
      emit(VerifyCodeSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      } else if (error.response!.statusCode == 401) {
        errorMessage = 'Wrong Code';
      }
      emit(VerifyCodeErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(VerifyCodeErrorState(errorMessage: errorMessage));
    }
  }

  Future<void> resetPassword(String newPassword) async {
    String errorMessage = Strings.defaultErrorMessage;
    emit(ResetPasswordLoadingState());
    try {
      await _forgetPasswordRepo.postResetPassword(
        resetPasswordModel: ResetPasswordModel(
          newPassword: newPassword,
          code: recoveryCode,
          accessToken: accessToken,
        ),
      );
      emit(ResetPasswordSuccessState());
    } on DioError catch (error) {
      if (error.response == null) {
        errorMessage = Strings.noInternetErrorMessage;
      }
      emit(ResetPasswordErrorState(errorMessage: errorMessage));
    } catch (_) {
      emit(ResetPasswordErrorState(errorMessage: errorMessage));
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
