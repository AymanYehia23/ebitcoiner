import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());



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
