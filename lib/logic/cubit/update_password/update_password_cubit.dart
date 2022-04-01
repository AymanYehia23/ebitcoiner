import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hash_store/data/repositories/update_password_repo.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit(this._updatePasswordRepo) : super(UpdatePasswordInitial());
  //Business logic
   final UpdatePasswordRepo _updatePasswordRepo;
  Future<String> updatePassword(String password, String rePassword) async {
    emit(UpdatePasswordLoadingState());
    try {
      String res = await _updatePasswordRepo.putUpdatePassword(
          password: password, rePassword: rePassword);
      emit(UpdatePasswordSuccessState());
      return res;
    } on DioError catch (error) {
      emit(UpdatePasswordErrorState());
      return error.response!.data;
    }
  }

  //UI logic
  bool isEmpty = true;
  bool isObscure = true;
  IconData iconData = Icons.visibility_outlined;
  bool isObscure2 = true;
  IconData iconData2 = Icons.visibility_outlined;

  void changePasswordVisibility() {
    emit(ChangePasswordVisibilityLoadingState());
    isObscure = !isObscure;
    iconData =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilitySuccessState());
  }

  void changePasswordVisibility2() {
    emit(ChangePasswordVisibilityLoadingState());
    isObscure2 = !isObscure2;
    iconData2 =
        isObscure2 ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilitySuccessState());
  }
}
