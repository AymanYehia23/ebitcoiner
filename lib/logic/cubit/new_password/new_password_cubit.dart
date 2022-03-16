import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit() : super(NewPasswordInitial());

  bool isEmpty = true;
  bool isObscure = true;
  bool reIsObscure = true;

  IconData iconData = Icons.visibility_outlined;
  IconData reIconData = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isObscure = !isObscure;
    iconData =
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

    void changeRePasswordVisibility() {
    reIsObscure = !reIsObscure;
    reIconData =
        reIsObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeRePasswordVisibilityState());
  }
}
